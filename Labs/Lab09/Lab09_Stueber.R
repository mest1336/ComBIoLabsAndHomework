#Lab 09
#Melinda Stueber

library(tidyverse)
getwd()
setwd("C:/Users/melin/Classes/EBIO-4420")
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

#look at data
str(camData)
head(camData)

#Convert DateTime into separate Date Time columns 

newcamData <- tidyr::separate(camData, DateTime, c("date", "time"), sep = " ")

#Problem 2: fixing the incorrect years
grep("[0-9]{2}", newcamData$date, value = T) #thought this would work to find years with 2 digits but I then realized it's taking the whole entry (day, month, and year)
newcamData$Date1 <-as.POSIXct(newcamData$date) #just want to see if this will convert everything into same format 

str(newcamData$Date1)
head(newcamData$Date1)
head(newcamData$date)

as.Date(newcamData$Date1)
grep("-2013", newcamData$Date1) #showed zero results
grep("13", newcamData$Date1)


