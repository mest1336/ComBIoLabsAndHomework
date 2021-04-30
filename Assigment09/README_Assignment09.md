


## Different Ecosystems’ Plant Community Responses to the Interactive Effects of Resource Limitation, Asymmetric Competition, and Microbial Communities
#### Introduction/Context: 
The purpose of this project is to use the data found on the Dyrad from the research article "Teasing Apart Plant Community Responses to N Enrichment: The Role of Resource Limitation, Competition, and Soil Microbes" to recreate the analyze of the three different ecosystem interactions to manipulation of resources, competition, and the soil microbial community. The goal is to enhance my ability to clean, interpret, analyze, and visual the data. To this, I will be following the statistical analyses that the authors, Katharine Suding and Emily Farrer, performed on this data using ANOVAs. In addition, by going through the process of analyzing the data I will come out with a stronger understanding of not only the statistical, but also the biological results of this experiment.  Thus, my question will be similar to the authors: **how does the alpine tundra, tallgrass prairie, and desert grassland response changes in resource limitation, asymmetric competition and microbial communities?**

#### Methods

##### Source of the data:
The goal of the original study (Farrer and Suding 2016) was to better understand the importance of the mechanisms driving the effects of nitrogen on productivity, diversity, and plant species composition. More specifically, Suding and Farrer wanted to test the hypothesis that aspects of plant response are driven by the distinct aspect of environmental change that is associated with nitrogen enrichment like resource limitation, asymmetric competition, and the interactions that occur with the soil microbial community.  In addition, to look at how strongly this effect takes place in different systems they decided to look at tallgrass prairie, alpine tundra, and desert grassland ecosystems.

##### Methodology of the Farrer and Suding (2016) experiment

Farrer and Suding (2016) used greenhouse mesocosm experiments by manipulating the treatments in all factorial combinations to examine the interactive effects of resource limitation in terms of nitrogen, competition asymmetry, and microbial community on the productivity, diversity, and plant species composition of tall grass prairie, alpine tundra, and desert grassland. They manipulated resource limitation with nitrogen fertilization, competition asymmetry with low planting density, and microbial communities with soil inoculum (from control vs. nitrogen fertilized field plots). They replicated each treatment combination six times in the factorial design which means there were 48 treatment mesocosms per system (tall grass prairie, alpine tundra, and desert grassland).

These three systems were associated with three LTER sites where the tall grass prairie related to Konza, Kansas, the alpine tundra was connected with Niwot Ridge, Colorado, and the desert grassland was connected with Sevilleta, New Mexico. They selected nine species from each site (based on abundance, functional group, and seed availability). For the soil the authors approximated the soil characteristics at each site and diluted it based on the site. For soil inoculum, it was collected from each site where long-term fertilization experiments were occurring. The authors wanted to test the effect of a microbial community on plant measurements, so they also planted more mesocosms that had autoclaved inoculum instead of lie inoculum. The data that was provided a csv file that is in long format and has 36 columns with 161 rows. Compared to some data files this one is exceptionally clean.  

To analyze the data Farrer and Suding (2016) decided to look at the effects of fertilization, density, and the microbial inoculum as well as all interactions on productivity and diversity using the ANOVA in R- specifically with the package nlme and function gls(). Then using the vegan package, they ran a redundancy analysis to test the significance of the explanatory variables. Next, they created stacked bar plots to visualize the importance of their explanatory variables, fertilization, density, and microbial inoculum), on productivity, diversity, and species composition.

The final step Farrer and Suding (2016) performed was to look at the presence of soil microbes and how that affected productivity, diversity, and plant composition by using ANOVA and RDA>

##### Personal Statistic Methodology

To approach this dataset, I first look at it in excel to observe spelling, columns, and any obvious mistakes I could catch with my own eye. Then I put the dataset into R studio and used various commands to figure out how many columns I had, where the NAs were located, and the type of variables that were in the dataset. I realized that it would be difficult to analyze the dataset if it stayed the way it was, so I split it up into three datasets based on the ecosystem type using piping and filtering. Next, I realized that some columns were unnecessary because they pertained to a specific ecosystem, so I removed them which in turn got rid of the NAs by using the command select if from the package “dyplr” (Wickham 2020).

I then realized to visualize the data it would take a lot of repeated code, so I made my own function to plot the response variable against two of the explanatory variables for each of the three ecosystems. I then did as Suding and Farrer (2016) did and calculated relative abundance of biomass for each species using the piping tool and summarise function. Then to join the new columns to the old data set I used left_join.

Next, I was ready to analyze the data by doing ANOVAs for each response variable for each ecosystem. Because it was a lot of repeating code, I again made a function to help reduce the amount of code that was being repeated. I wanted to then check the assumptions of each ANOVA to make sure the data set was normally distributed, and the residuals were random.

Finally, I was ready to visualize the results I obtained, and I wanted to compare the different ecosystems to see how different the results were from each (Alpine tundra, Desert grassland, and Tallgrass prairie). I did this by using the package “ggplot2” (Wickham 2016) and “gridExtra” (Baptiste 2017).

#### Results and Conclusions

I found that in tallgrass prairie and alpine tundra productivity was significantly affected by density, inoculum, and fertilization. Moreover, for both evenness and richness, fertilizer and density played a significant role according to the results from the ANOVA for both ecosystems. However, in the desert grassland only fertilizer and inoculum were significant for productivity. In addition, only inoculum was significant for evenness and Shannon’s diversity in the desert ecosystem. Overall, it seemed that the alpine tundra and tallgrass prairie responded similarly compared to the desert grassland in regards to diversity.

#### Reference

Baptiste Auguie (2017). gridExtra: Miscellaneous  Functions for "Grid" Graphics. R package version 2.3. [https://CRAN.R-project.org/package=gridExtra](https://CRAN.R-project.org/package=gridExtra)
Farrer, Emily C.; Suding, Katharine N. (2017), Data from: Teasing apart plant community responses to N enrichment: the roles of resource limitation, competition and soil microbes, Dryad, Dataset,  
[https://doi.org/10.5061/dryad.mj0sf](https://doi.org/10.5061/dryad.mj0sf)

H. Wickham. ggplot2: Elegant Graphics for Data Analysis.  Springer-Verlag New York, 2016.
Hadley Wickham, Romain François, Lionel Henry and Kirill  Müller (2020). dplyr: A Grammar of Data Manipulation. R  package version 1.0.2.  https://CRAN.R-project.org/package=dplyr





