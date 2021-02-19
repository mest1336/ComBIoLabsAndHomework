#Lab 04
#Melinda Stueber

#Part 1: Practicing writing "for loops"
for (hi in c(1:10)) {
  print("hi")
}
#Part 1 (2): Tim
piggyBank <- 10 #dollars
allowance <- 5 #dollars
gumCost <- 2 * 1.34 #cost of 2 packs of gum per week
week <- 8 # time frame

for (i in 1:week) {
  newBalance <- piggyBank + allowance - gumCost
  piggyBank <-newBalance
  print(newBalance)
}
#Part 1 (3): Conservation Biologist
currentPopulation <- 2000
populationGrowthpercent <- 0.05
years <- 7

for (i in (1:years)) {
  currentPopulation <- currentPopulation - (currentPopulation * populationGrowthpercent)
    print(currentPopulation)
}

#Part 1 (4): Abundance of Population 
N0 = 2500
times = 12
K = 10000
N = vector(length = times)
rate = 0.8
N[1] = N0

for (t in 2:times) {
 N[t] = N[t - 1] + (r * N[t - 1] * (K - N[t - 1])/K)
 }
print(N) #stored data

#Part II: Practing writing loops and storing data 
#Question 5.a
rep(0, 18)

#5.b
for (i in seq(1,18)) {
 third <- i * 3
 print(third)
}

#5.c
zero <- rep(0, 18)
zero[1] = zero[1] +1
zero

#5.d

for (i in 2:length(zero)) {
  zero[i] = 1 + 2 * zero[i - 1]
  }
print(zero)

#6: Fibonacci sequence
fibonacci <- rep(0, 20)
fibonacci[2] = fibonacci[2] +1

for (i in 3:length(fibonacci)) {
  fibonacci[i] = fibonacci[i-1] + fibonacci[i-2]
}
print(fibonacci)

#7 redoing question for to store data
time <- c(1:12)
abundance <- N
plot(time, abundance)
