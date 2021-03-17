#Lab08
#Melinda Stueber

# 3.a code from problem #7 Week 4 Lab 
N0 <- 2500
times <- 12
K <- 10000
N <- vector(length = times)
r <- 0.8
N[1] <- N0

for (t in 2:times) {
  N[t] = N[t - 1] + (r * N[t - 1] * (K - N[t - 1])/K)
}
print(N) #stored data

time <- c(1:12)
abundance <- N
plot(time, abundance)

#3.b turn the logistic growth model code into a function that takes #intrinsic growth rate (r), the carrying capacity (k), total number of generations, and initial population size as its arguments
.
# N = generations, p0 = initial population size 
LogisticGrowth <- function(r, K, N, p0) {
 N <- vector(length = N)
 N[1] <- p0
   for (t in 2:length(N)) {
   N[t] = N[t -1] + (r* N[t - 1] * (K - N[t - 1])/K)
    }
 time <- c(1:length(N))
 abundance <- N
 plot(time, abundance,
      main = "Logistic Growth Population Model", ylab = "Abundance", xlab = "Generations") #3.c
 return(N)
}

#3.d write a line of code that calls the function
LogisticGrowth(0.7, 3000, 14, 100)

#3.e write a line of code that write the data set to a file (two columns, generations and abundance)
Abundance <- LogisticGrowth(0.7, 3000, 14, 100)
length(Abundance)
Generations <- c(1:length(Abundance))
Populationgrowth <-cbind(Generations, Abundance)

write.csv(Populationgrowth, file = "C:/Users/melin/Classes/EBIO-4420/CompBioLabsAndHW/Labs/Lab08/DataSet_Gen_Pop.csv")


