# Working with some data from the Colorado Department of Public Health
# and Environment (CDPHE) on COVID-19 in Colorado.

# Change the next line to work for YOUR OWN computer:
setwd("C:/Users/melin/Classes/EBIO-4420/compBioSandbox/CompBio_on_git/Datasets/COVID-19/CDPHE_Data/CDPHE_Data_Portal/DailyStateStats2")

stateStatsData <- read.csv("CDPHE_COVID19_Daily_State_Statistics_2_2021-04-02.csv", 
                           stringsAsFactors = F)

head(stateStatsData)
str(stateStatsData)
####################################################
## Explore the data
####################################################
# here are some suggestions for simple exploration , but please use your own ideas!
names(stateStatsData) 
str(stateStatsData)
summary(stateStatsData)
unique(stateStatsData$Name)
unique(stateStatsData$Desc_)
table(stateStatsData$Name)



##################################################################
##  Tasks
##################################################################

# try to figure out ways to do all of the following using functions 
# from the Tidyverse
library(tidyverse)

# 1. subset the data so that we only keep the rows where the text in the column (variable) named "Name" is "Colorado"
stateStatsData <- stateStatsData %>%
  filter(ï..Name %in% "Colorado")
# 2. subset to keep (select) only the columns "Date", "Cases", and "Deaths"
stateStatsData$Deaths

substateStats <-stateStatsData %>%
  select("Date", "Cases", "Deaths")
head(substateStats)


# 3. change the data in the "Date" column to be actual dates rather than a character
stateStatsData$Date <- strptime(substateStats$Date, format = "%m/%d/%Y", tz = "")

# 4. sort the data so that the rows are in order by date from earliest to latest
new <- substateStats %>% 
  arrange(Date)

# 5. subset the data so that we only have dates prior to May 15th, 2020
stateStatsData$Date <- as.POSIXlt(new$Date, format = "%m/%d/%Y", tz = "")
dt <- as.Date("2020-05-15")
index <- which(as.Date(stateStatsData$Date) < dt)
priorDates <- stateStatsData[index , ]


# do it all in one pipeline with pipes
stateStatsData$Name <- stateStatsData$ï..Name
ColoradoData <- stateStatsData %>%
  filter( Name == "Colorado") %>%
  select(Date, Cases, Deaths) %>%
  mutate( Date = strptime( Date, format = "%m/%d/%Y", tz = "") ) %>%
  arrange( Date ) %>%
  filter( Date < as.POSIXlt("2020-05-15") ) # dt defined above
ColoradoData$Date

#Part 2: Make plots in R using the data from Part 1
ColoradoData$Date <- ymd(ColoradoData$Date)
ColoradoData$Date
ggplot(ColoradoData, aes(x = Date, y = Cases)) + geom_line() + scale_x_date(date_labels = "%b-%d-%Y") + scale_y_log10()
ggplot(ColoradoData, aes(x = Date, y = Deaths)) + geom_line() + scale_x_date(date_labels = "%b-%d-%Y")+ scale_y_log10()

#Part 3: Write Function for Adding Doubling Times
coloradocases <- ggplot(ColoradoData, aes(x = Date, y = Cases)) + geom_line() + scale_x_date(date_labels = "%b-%d-%Y")

addDoublingTimeRefLines <- function(myPlot, DoublingTimeVec, SomeKindofData, startFrom) {
  DoublingTimeVec <- 
  startFrom <- DoublingTimeVec[1]
  
  return(myPlot)
}

