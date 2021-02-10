
#Melinda Stuber
#EBIO 4220 
#Lab 3



# Step # 3: Making Variables for chip bags and guests
numberofbags <- 5
numberofguest <- 8

# Step #5: Average amount of bags of chips eaten/person
avgamounteaten <- 0.4

# Step #7: Calculating how many chips will be leftover
me <- 0.4

leftover <- numberofbags - (numberofguest * avgamounteaten) - (me)
leftover

# Part II: Step #8

self <- c(7, 9, 8, 1, 2, 3, 4, 6, 5)
Penny <- c(5, 9, 8, 3, 1, 2, 4, 7, 6)
Lenny<- c(6, 5, 4, 9, 8, 7, 3, 2, 1)
Stewie <- c(1, 9, 5, 6, 8, 7, 2, 3, 4)

# Step #9
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

#Step #10: combine all ranks into one data object
allranks <- cbind(self, Penny, Lenny, Stewie)

#Step #11: inspect structures
str(PennyIV)
str(Penny)
# PennyIV is just one number while Penny is a vector with 9 numbers

#Step #12: make data frame with 4 vectors
dataallranks <-data.frame(allranks)
as.data.frame(allranks)

#Step 13: Difference between cbind() and data frame
dim(allranks)
dim(dataallranks)
str(allranks)
str(dataallranks)
typeof(allranks)
typeof(dataallranks)
allranks == dataallranks
# Both data objects contain the same characters and numerical values (4 characters that each have 9 numerical values). The difference is the allranks (created with cbind) is categorized as "double" whereas dataallranks (made into a dataframe) is a list. In addition, the data.frame sets up the vectors as having 4 variables with 9 observations each. 

#Part #14: making vector of episode names
episodenames <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

#Part #15: using row.names()
row.names(dataallranks) <- episodenames
head(dataallranks)

#Part #16: Accessing 3rd row of matrix
allranks[3, ]

#Part #17: Access 4th column from data frame
dataallranks[ ,4]

#Part #18: Access ranking for Episode V
dataallranks[5,1]

#Part #19: Access Penny's ranking Episode II
dataallranks[2,2]

#Part #20: Everyone's ranking for episode IV-Vi
dataallranks[4:9, ]

#Part #21: Everyone's ranking for episode II, V, and VII
dataallranks[c(2, 5, 7), ]

#Part #22: Access Penny and Stewie's rankings episodes IV and VI
dataallranks[c(4, 6), c(2,4)]

#Part #23: switch Lenny's ranking for Episode II and V
newvariable <- dataallranks[2, 3]
dataallranks[2, 3] <- dataallranks[5, 3]
dataallranks[5, 3] <- newvariable
head(dataallranks)

#Part #24: testing examples
allranks["III", "Penny"]
dataallranks["III", "Penny"]

#Part #25: Undo switches
switch <- dataallranks$Lenny[2]
dataallranks$Lenny[2] <- dataallranks$Lenny[5]
dataallranks$Lenny[5] <- switch
head(dataallranks)

#Part #26: Redo switches
switchagain <- dataallranks$Lenny[2]
dataallranks$Lenny[2] <- dataallranks$Lenny[5]
dataallranks$Lenny[5] <- switchagain
head(dataallranks)
