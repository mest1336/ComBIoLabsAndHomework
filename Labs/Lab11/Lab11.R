#Melinda Stueber
#Lab 11

getwd()
setwd("C:/Users/melin/Classes/EBIO-4420")
#Part 1: get tidyverse
library(tidyverse)

densityData <- read_csv("GlobalWoodDensityDatabase1.csv")
head(densityData)
str(densityData)
colnames(densityData)
densityData$Wood_density <- densityData$`Wood density (g/cm^3), oven dry mass/fresh volume`
densityData = subset(densityData, select = - `Wood density (g/cm^3), oven dry mass/fresh volume`)
length(densityData$Wood_density)
colnames(densityData)
#Part II: Working with density data
which(densityData$Wood_density == NA)
densityData[is.na(densityData$Wood_density), ]
densityData[12150, ]
#NA is in row 12150 
#Need to drop NA

densityData <-densityData %>%
  drop_na()

densityData[12150, ]

#dealing with pseudo-replication

densitydata1 <- densityData%>%
  group_by(Family, Binomial)%>%
  summarize(Density = mean(Wood_density))
length(densitydata1$Family)


#density for each faimly

familydensity <-densitydata1 %>%
  group_by(Family)%>%
  summarize(MeanDensity = mean(Density))
  
length(familydensity$Family)

#sort data
familydensityorder <-familydensity %>%
  arrange(desc(MeanDensity))

#8 families with highest average densities
familydensityorder[1:8, ]

#8 families with lowest average densities
familydensityorder[183:191, ]

#Part III:
library(ggplot2)
highestden <- densitydata1%>%
  filter(Family %in% c("Hypericaceae", "Zygophyllaceae", "Sarcolaenaceae", "Irvingiaceae", "Surianaceae", "Linaceae", "Bonnetiaceae", "Asteropeiaceae"))
ggplot(highestden, aes(x = Family, y = Density)) + geom_boxplot() + facet_wrap(~Family, scale = "free")
