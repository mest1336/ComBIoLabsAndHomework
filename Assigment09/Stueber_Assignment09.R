#Melinda Stueber Final Project 

getwd()
# Step 1: Import the data
greenhousedata <- read.csv("KNZ_NWT_SEV_greenhouse_exp_Dryad.csv")
# Step 2: Check the data for missing information, gaps, column headings etc.
head(greenhousedata) #there are many NA's in the species columns
tail(greenhousedata)
length(greenhousedata) #36 columns
length(greenhousedata$Pot_ID)#160 rows
sum(is.na(greenhousedata)) #2880 NAs in dataset
colnames(greenhousedata)
unique(greenhousedata$Ecosystem)
str(greenhousedata)
#step 3 get useful packages
library(dplyr)
library(ggplot2)
library(tidyr)
# Step 3: Figure out a way to separate the data into the three categories: tall grass prairie, alpine tundra, and desert grassland 
tallgrass <-greenhousedata %>%
  filter(Ecosystem %in% "tallgrass prairie")
head(tallgrass)
unique(tallgrass$Ecosystem) #checking to make sure it worked 
length(tallgrass$Pot_ID) # now 53 rows

alpinetundra <- greenhousedata %>%
  filter(Ecosystem %in% "alpine tundra")
head(alpinetundra)
unique(alpinetundra) #checking to make sure it worked 
length(alpinetundra$Pot_ID) # now 53 rows

desertgrass <- greenhousedata %>% 
  filter(Ecosystem %in% "desert grassland")
head(desertgrass)
unique(desertgrass$Ecosystem) #checking to make sure it worked 
length(desertgrass$Pot_ID) # now 54 rows

#Remove NA's from the three datasets
tallgrass <-tallgrass %>%
  select_if( ~ !all(is.na(.))) # from https://stackoverflow.com/questions/12454487/remove-columns-from-dataframe-where-some-of-values-are-na
sum(is.na(tallgrass)) # check to see if it worked

alpinetundra <- alpinetundra %>%
  select_if( ~ !all(is.na(.)))
sum(is.na(alpinetundra)) # check to see if it worked

desertgrass <-desertgrass %>%
  select_if( ~ !all(is.na(.)))
sum(is.na(desertgrass))

# Step 4: Visualize data to get better understanding of the patterns
# NOte project explanatory variables are nitrogen, competition asymmetry, and microbial community 
#Project response variables are productivity, diversity, and plant species composition
#made function to make plotting faster 
plot_against_explan <- function(response, ecosystem) {
  par(mfrow = c(1,2))
 plot(ecosystem$Inoculum, response)
 plot(ecosystem$Fertilizer, response)
par(mfrow = c(1,3))
}

#plot tallgrass
plot_against_explan(tallgrass$Andropogon.gerardii, tallgrass)
plot_against_explan(tallgrass$Asclepias.verticillata, tallgrass)
plot_against_explan(tallgrass$Bouteloua.curtipendula, tallgrass)
plot_against_explan(tallgrass$Brickellia.eupatorioides, tallgrass)
plot_against_explan(tallgrass$Lespedeza.capitata, tallgrass)
plot_against_explan(tallgrass$Panicum.virgatum, tallgrass)
plot_against_explan(tallgrass$Dalea.candida, tallgrass)
plot_against_explan(tallgrass$Solidago.canadensis, tallgrass)
plot_against_explan(tallgrass$Sorghastrum.nutans, tallgrass)
plot_against_explan(tallgrass$Productivity, tallgrass)
plot_against_explan(tallgrass$Shannon_diversity, tallgrass)

#plotting alpine 
plot_against_explan(alpinetundra$Geum.rossii, alpinetundra)
plot_against_explan(alpinetundra$Artemisia.scopulorum, alpinetundra)
plot_against_explan(alpinetundra$Polygonum.bistortoides, alpinetundra)
plot_against_explan(alpinetundra$Carex.scopulorum, alpinetundra)
plot_against_explan(alpinetundra$Deschampsia.cespitosa, alpinetundra)
plot_against_explan(alpinetundra$Erigeron.simplex, alpinetundra)
plot_against_explan(alpinetundra$Potentilla.diversifolia, alpinetundra)
plot_against_explan(alpinetundra$Trifolium.parryi, alpinetundra)
plot_against_explan(alpinetundra$Trisetum.spicatum, alpinetundra)
plot_against_explan(alpinetundra$Productivity, alpinetundra)
plot_against_explan(alpinetundra$Shannon_diversity, alpinetundra)

#Plotting Desert Grass
plot_against_explan(desertgrass$Aristida.purpurea, desertgrass)
plot_against_explan(desertgrass$Astragalus.nuttallianus, desertgrass)
plot_against_explan(desertgrass$Bouteloua.eriopoda, desertgrass)
plot_against_explan(desertgrass$Bouteloua.gracilis, desertgrass)
plot_against_explan(desertgrass$Cryptantha.crassisepala, desertgrass)
plot_against_explan(desertgrass$Gutierrezia.sarothrae, desertgrass)
plot_against_explan(desertgrass$Melampodium.leucanthum, desertgrass)
plot_against_explan(desertgrass$Pleraphis.jamesii, desertgrass)
plot_against_explan(desertgrass$Sporobolus.flexuosus, desertgrass)
plot_against_explan(desertgrass$Productivity, desertgrass)
plot_against_explan(desertgrass$Shannon_diversity, desertgrass)

# Step 5: Figure out how to calculate the relative abundance of biomass for each species 
#tall grass
colnames(tallgrass)
tallgrass1 <-tallgrass %>%
  group_by(Pot_ID) %>%
  summarise(totalbiomass = sum(Andropogon.gerardii, Asclepias.verticillata, Bouteloua.curtipendula, Brickellia.eupatorioides, Lespedeza.capitata, Panicum.virgatum, Dalea.candida, Solidago.canadensis, Sorghastrum.nutans),
            RA_Andr = Andropogon.gerardii / totalbiomass,
            RA_Asc = Asclepias.verticillata / totalbiomass,
            RA_Bou = Bouteloua.curtipendula / totalbiomass,
            RA_Bri = Brickellia.eupatorioides / totalbiomass,
            RA_Les = Lespedeza.capitata / totalbiomass,
            RA_Pan = Panicum.virgatum / totalbiomass,
            RA_Dal = Dalea.candida / totalbiomass,
            RA_Sol = Solidago.canadensis / totalbiomass,
            RA_Sor = Sorghastrum.nutans / totalbiomass)
tallgrass <- tallgrass %>%
  left_join(tallgrass1) #recombining with the rest of the data for analysis later on 
colnames(tallgrass) # checking to see if it worked

#alpine tundra
colnames(alpinetundra)
alpinetundra1 <-alpinetundra %>%
  group_by(Pot_ID) %>%
  summarise(totalbiomass = sum(Geum.rossii, Artemisia.scopulorum, Polygonum.bistortoides, Carex.scopulorum, Deschampsia.cespitosa, 
            Erigeron.simplex, Potentilla.diversifolia, Trifolium.parryi, Trisetum.spicatum),
            RA_Geu = Geum.rossii / totalbiomass,
            RA_Art =  Artemisia.scopulorum / totalbiomass,
            RA_Poly = Polygonum.bistortoides / totalbiomass,
            RA_Car = Carex.scopulorum / totalbiomass,
            RA_Des = Deschampsia.cespitosa / totalbiomass,
            RA_Eri = Erigeron.simplex / totalbiomass,
            RA_Pot = Potentilla.diversifolia / totalbiomass,
            RA_Trif = Trifolium.parryi / totalbiomass,
            RA_Tris = Trisetum.spicatum / totalbiomass)
alpinetundra <- alpinetundra %>%
  left_join(alpinetundra1) #recombining with the rest of the data for analysis later on 
colnames(alpinetundra) # checking to see if it worked

#desert grass
colnames(desertgrass)
desertgrass1 <-desertgrass %>%
  group_by(Pot_ID) %>%
  summarise(totalbiomass = sum(Aristida.purpurea, Astragalus.nuttallianus, Bouteloua.eriopoda, Bouteloua.gracilis, Cryptantha.crassisepala ,Gutierrezia.sarothrae, Melampodium.leucanthum, Pleraphis.jamesii, Sporobolus.flexuosus),
            RA_Ari = Aristida.purpurea / totalbiomass,
            RA_Ast =  Astragalus.nuttallianus / totalbiomass,
            RA_Bou.er = Bouteloua.eriopoda / totalbiomass,
            RA_Bou.gra = Bouteloua.gracilis / totalbiomass,
            RA_Cry = Cryptantha.crassisepala / totalbiomass,
            RA_Gut = Gutierrezia.sarothrae / totalbiomass,
            RA_Mel = Melampodium.leucanthum / totalbiomass,
            RA_Ple = Pleraphis.jamesii / totalbiomass,
            RA_Spo = Sporobolus.flexuosus / totalbiomass)
desertgrass <- desertgrass %>%
  left_join(desertgrass1) #recombining with the rest of the data for analysis later on 
colnames(desertgrass) # checking to see if it worked

# Step 6: Run ANOVA for all predictor variables: nitrogen, competition asymmetry, and microbial community
# response variable productivity, diversity, and plant species composition
anovalimitations <- function(response, ecosystem) {
  aov1 <-aov(response ~ Fertilizer + Inoculum + Density, data = ecosystem)
  summary(aov1)
}
anovalimitations(tallgrass$Productivity, tallgrass) # all significant
anovalimitations(tallgrass$Shannon_diversity, tallgrass) # fertilizer and Density significant
anovalimitations(tallgrass$Richness, tallgrass) # nothing significant
anovalimitations(tallgrass$Evenness, tallgrass) # fertilizer and density significant 
anovalimitations(tallgrass$RA_Andr, tallgrass) # nothing significant
anovalimitations(tallgrass$RA_Asc, tallgrass) # Density significant
anovalimitations(tallgrass$RA_Bou, tallgrass) #nothing significant
anovalimitations(tallgrass$RA_Bri, tallgrass) # Inoculum significant
anovalimitations(tallgrass$RA_Les, tallgrass) # nothing significant
anovalimitations(tallgrass$RA_Pan, tallgrass) # inoculum significant
anovalimitations(tallgrass$RA_Sol, tallgrass) # Fertilizer and Inoculum significant 
anovalimitations(tallgrass$RA_Sor, tallgrass) # nothing significant
anovalimitations(tallgrass$RA_Dal, tallgrass) # Fertilizer was significant 
# Have to check assumptions for tallgrass anovas
anovaassumptions <- function(response, ecosystem) {
  aov1 <-aov(response ~ Fertilizer + Inoculum + Density, data = ecosystem)
  plot(aov1, 1)
  plot(aov1, 2)
  par(mfrow = c(1:2))
}
anovaassumptions(tallgrass$Productivity, tallgrass) # appears to have a little heteroscedasticity 
anovaassumptions(tallgrass$Shannon_diversity, tallgrass) # appears normal with no evidence of relationship between fitted values and residuals
anovaassumptions(tallgrass$Richness, tallgrass) # Residuals vs fitted doesn't look as good
anovaassumptions(tallgrass$Evenness, tallgrass) # appears normal with no evidence of relationship between fitted values and residuals
anovaassumptions(tallgrass$RA_Andr, tallgrass) # appears normal with no evidence of relationship between fitted values and residuals; however, there are outliers that could be skewing data
anovaassumptions(tallgrass$RA_Asc, tallgrass) # appears pretty normal, may have litter heteroscedasticity with no evidence between fitted values and residuals' however, there are outliers that could be skewing data
anovaassumptions(tallgrass$RA_Bou, tallgrass) # Residuals vs fitted looks like it may have a cone shape, looks normal for the qq plot
anovaassumptions(tallgrass$RA_Bri, tallgrass) # appears to have a little heteroscedasticity 
anovaassumptions(tallgrass$RA_Les, tallgrass) # appears to have a little heteroscedasticity , cone shape for residuals vs fitted, and outliers that could be skewing data
anovaassumptions(tallgrass$RA_Pan, tallgrass) # might be slight cone shape for residuals vs fitted, looks normally distributed from qq plot
anovaassumptions(tallgrass$RA_Sol, tallgrass) # ppears to have a little heteroscedasticity and a little bit of a cone shape for residuals vs fitted, and outliers that could be skewing data
anovaassumptions(tallgrass$RA_Sor, tallgrass) # qq plot doesn't look like data is normally distributed, residuals and fitted also don't look random 
anovaassumptions(tallgrass$RA_Dal, tallgrass) # outliers skewing data normality  
# alpine tundra ANOVA
anovalimitations(alpinetundra$Productivity, alpinetundra) # all significant
anovalimitations(alpinetundra$Shannon_diversity, alpinetundra) # fertilizer and Density significant
anovalimitations(alpinetundra$Richness, alpinetundra) # nothing significant
anovalimitations(alpinetundra$Evenness, alpinetundra) # all significant 
anovalimitations(alpinetundra$RA_Art, alpinetundra) # all significant
anovalimitations(alpinetundra$RA_Car, alpinetundra) # nothing significant
anovalimitations(alpinetundra$RA_Des, alpinetundra) # nothing significant
anovalimitations(alpinetundra$RA_Eri, alpinetundra) # all significant
anovalimitations(alpinetundra$RA_Geu, alpinetundra) # Fertilizer and Inoculum significant
anovalimitations(alpinetundra$RA_Poly, alpinetundra) # Density
anovalimitations(alpinetundra$RA_Pot, alpinetundra) # All significant (especially density)
anovalimitations(alpinetundra$RA_Trif, alpinetundra) # Density significant
anovalimitations(alpinetundra$RA_Tris, alpinetundra) #Fertilizer significant 

#Testing alpine tundra anova assumptions
anovaassumptions(alpinetundra$Productivity, alpinetundra) # fairly normal and random
anovaassumptions(alpinetundra$Shannon_diversity, alpinetundra) # appears to have a little heteroscedasticity
anovaassumptions(alpinetundra$Richness, alpinetundra) # Species Richness affects randomness of residuals
anovaassumptions(alpinetundra$Evenness, alpinetundra) # appears to have a little heteroscedasticity
anovaassumptions(alpinetundra$RA_Art, alpinetundra) # pretty random residuals and normal distribution 
anovaassumptions(alpinetundra$RA_Car, alpinetundra) # pretty random residuals and normal distribution
anovaassumptions(alpinetundra$RA_Des, alpinetundra) # appears to have a little heteroscedasticity
anovaassumptions(alpinetundra$RA_Eri, alpinetundra) # outliers are affecting qq plot significantly
anovaassumptions(alpinetundra$RA_Geu, alpinetundra) #  residuals cone shaped
anovaassumptions(alpinetundra$RA_Poly, alpinetundra) # pretty normal
anovaassumptions(alpinetundra$RA_Pot, alpinetundra) # normal except for outliers
anovaassumptions(alpinetundra$RA_Trif, alpinetundra) # pretty normal
anovaassumptions(alpinetundra$RA_Tris, alpinetundra) # residuals cone shaped 

#Desert grassland anova
anovalimitations(desertgrass$Productivity, desertgrass) # Fertilizer and Inoculum significant
anovalimitations(desertgrass$Shannon_diversity, desertgrass) # Inoculum significant
anovalimitations(desertgrass$Richness, desertgrass) # Density significant
anovalimitations(desertgrass$Evenness, desertgrass) # Inoculum significant
anovalimitations(desertgrass$RA_Ari, desertgrass) # no significance
anovalimitations(desertgrass$RA_Ast, desertgrass) # Density 
anovalimitations(desertgrass$RA_Bou.er, desertgrass) # Inocululm significant
anovalimitations(desertgrass$RA_Cry, desertgrass) # no significance
anovalimitations(desertgrass$RA_Gut, desertgrass) # Density significant
anovalimitations(desertgrass$RA_Mel, desertgrass) # Density significant
anovalimitations(desertgrass$RA_Ple, desertgrass) # Density significant 
anovalimitations(desertgrass$RA_Spo, desertgrass) # no significance 
anovalimitations(desertgrass$RA_Bou.gra, desertgrass) #Fertililzer significance 

#Checking desert grassland assumptions
anovaassumptions(desertgrass$Productivity, desertgrass) # appears to have a little heteroscedasticity, residuals random
anovaassumptions(desertgrass$Shannon_diversity, desertgrass) # residuals random, outliers
anovaassumptions(desertgrass$Richness, desertgrass) # residuals not as random, outlier
anovaassumptions(desertgrass$Evenness, desertgrass) # Inoculum significant
anovaassumptions(desertgrass$RA_Ari, desertgrass) # pretty random residuals, some outliers
anovaassumptions(desertgrass$RA_Ast, desertgrass) # pretty random residuals, outliers affecting qq plot
anovaassumptions(desertgrass$RA_Bou.er, desertgrass) # residuals not as random, qq plot shows normality 
anovaassumptions(desertgrass$RA_Cry, desertgrass) # residuals not as random, outliers affecting qq plot
anovaassumptions(desertgrass$RA_Gut, desertgrass) # cone shape for residuals, oultiers affecting qq plot
anovaassumptions(desertgrass$RA_Mel, desertgrass) # pretty normal distribution and random
anovaassumptions(desertgrass$RA_Ple, desertgrass) # outliers affecting qq plot
anovaassumptions(desertgrass$RA_Spo, desertgrass) # pretty random residuals and normal distribution 
anovaassumptions(desertgrass$RA_Bou.gra, desertgrass) #Outliers affecting qq plot


# Step 8: Visualize results 
install.packages("ggplot2")
par(mfrow = c(1, 3))
tallfert <-ggplot(tallgrass, aes(x = Fertilizer, y = Productivity)) + geom_boxplot(fill = "green", color = "black") + ggtitle("Tallgrass Prairie")
alpinefert <- ggplot(alpinetundra, aes(x = Fertilizer, y = Productivity)) + geom_boxplot(fill = "blue", color = "black") + ggtitle("Alpine Tundra")
print(tallfert, position = c(0, 0, 0.5, 1), more = TRUE)
print(alpinefert, position = c(0.5, 0, 1, 1))
ggplot(desertgrass, aes(x = Fertilizer, y = Productivity)) + geom_boxplot(fill = "yellow", color = "black") + ggtitle("Desert Grassland")

par(mfrow = c(2, 1))
  ggplot(tallgrass, aes(x = Fertilizer, y = Productivity)) + geom_boxplot(fill = "green", color = "black")
  ggplot(alpinetundra, aes(x = Fertilizer, y = Productivity)) + geom_boxplot(fill = "blue", color = "black")


# Step 9: Visualize results using ggplot 
