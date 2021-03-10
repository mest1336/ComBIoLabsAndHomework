#Lab 7
#Melinda Stueber

#Problem 1
denominator <- 0.5

triangleArea <- function(base, height) {
  area <- base * height * denominator
  return(area)
}
triangleArea(10, 9)

#Problem 2 A
absolute <- -1

myAbs <- function(number) {
  if(number > 0) {
    return(number)
  } else(number < 0)
  number <- number * absolute
  return(number)
}

myAbs(5)
myAbs(-10)

#Problem 2 B
myAbs <- function(vector1) {
  if (is.integer(vector1) | is.numeric(vector1)) {
    for(number in 1:length(vector1)) {
    if(vector1[number] < 0) {
     vector1[number] <- sqrt(vector1[number]^2)
    } else if (vector1[number] > 0) {
        vector1[number] <- vector1[number]
    } 
  }
  return(vector1)
  }
}

practicevector <- c(1.1, 2, 0, -4.3, 9, -12)
myAbs(practicevector)

#Problem 3: Fibonacci Sequence 

Fibonacci <- function(x) {
  for (i in 3:length(x)) {
    x[i] = x[i-1] + x[i-2]
  }
  return(x)
}

#Problem 4 a: writing function that returns the square of the difference between them 
squareofdifference <- function(x, y) {
  result <- (x - y) ^ 2
  return(result)
}

squareofdifference(3,5)
vectortest <- c(2, 4, 6)
squareofdifference(vectortest, 4)

#Problem 4 b: write function that calculates the average of a vector of numbers

averageofVector <- function(x) {
  sumofvec <- sum(x)
  lengthofvec <- length(x)
  average <- sumofvec / lengthofvec
  return(average)
}
testing <- c(5, 15, 10)
averageofVector(testing)

#getting correct working directory
setwd("C:/Users/melin/Classes/EBIO-4420/CompBioLabsAndHW")
datalab7 <-read.csv("DataForLab07.csv")

#testing my function
averageofVector(datalab7$x)

#Part 4 c: sum of squares 
sumofsquares <- function(x) {
  for (i in 1:length(x)) {
    sumofvec <- sum(x)
    lengthofvec <- length(x)
    average <- sumofvec / lengthofvec
    squareddiff <- c((x - average) ^ 2)
    result <- sum(squareddiff)
    }
  return(result)
}

sumofsquares(datalab7$x)
