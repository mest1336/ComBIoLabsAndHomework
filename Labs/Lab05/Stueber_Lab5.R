#Lab 5 
#Melinda Stueber

getwd()
setwd("C:/Users/melin/Classes/EBIO-4420/CompBioLabsAndHW/Labs/Lab05")

#Part 1: 1
x <- 22
threshold <- 5
if(x > threshold) {
  print(paste("x is larger than 5", threshold))
} else {
  print(print("x is smaller than or equal to 5", threshold))
}

#2
exampledata <- read.csv("ExampleData.csv")
myvec <- exampledata$x
class(myvec)
myvec
#2.a
threshold2 <- 0
  for (i in 1:length(myvec)) {
    myvec[myvec < threshold2] <- NA
  }
myvec

#2.b
myvec[is.na(myvec)] <- NaN
myvec
#2.c
index <- which(is.nan(myvec))
myvec[index] <- 0
myvec

#2.d
startpoint <- 50
endpoint <- 100
index2 <- which(myvec > 50, myvec < 100)
length(myvec[index2])
#1504 values

#2.e
FiftyToOneHundred <- myvec[index2]
head(FiftyToOneHundred)
#2.f
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

#3.a
CO2data <-read.csv("CO2_data_cut_paste.csv")
gasnotzero <-which(CO2data$Gas != 0)
colnames(CO2data)
CO2data[gasnotzero, 1]
#1885

#3.b
totalemissions <- which(CO2data$Total > 200, CO2data$Total < 300)
CO2data[totalemissions, 1]

###Par II 
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

timevector <- c(1:totalGenerations)
n <- c(1:totalGenerations)
p <- c(1:totalGenerations)

n[1] = initPrey
p[1] = initPred
n
p
for (t in 2:totalGenerations) {
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
}
print(n)
print(p)

for (t in 2:totalGenerations) {
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
  if(p[t] < threshold2 | n[t] < threshold2) {
    p[p < threshold2] <- 0
    n[n < threshold2] <- 0
  }
}
print(p)
print(n)

#Fifth step: creating a plot of abudances of prey and predators over time
plot(timevector, n)
lines(timevector, p)

#Sixth step: creating a matrix
myResults <- matrix(data = NA, nrow = totalGenerations, ncol = 3)

#giving column names to matrix
columnnames <- c("TimeStep", "PreyAbundance", "PredatorAbundance")
colnames(myResults) <- columnnames
rownames(myResults) <- timevector
#putting vectors into matrix 
myResults[ ,1] <- timevector
myResults[ ,2] <- n
myResults[ ,3] <- p

#store data, check 
print(myResults)

write.csv(x = myResults, file = "PredPreyResults.csv")
