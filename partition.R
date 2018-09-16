# enable commandline arguments from script launched using Rscript
args<-commandArgs(TRUE)



csv_file <- args[1]

# comma delimiter
dataset <- read.csv(csv_file, header = TRUE, sep=",")

# library setup, depedencies are handled by R
library(caret) # for param tuning
library(e1071) # for normality adjustment
library(LiblineaR)

# name of outcome var to be predicted
outcomeName <- "label"


x=dataset[,1]
y=factor(dataset[,outcomeName])

z <- sample(1:4110, 1)  
print(z)
set.seed(z) #random seed between 1 and total number of comments  


#create stratified training and test sets from SO dataset
splitIndex <- createDataPartition(dataset[,outcomeName], p = .05, list = FALSE)
xTrain=x[splitIndex]
yTrain=y[splitIndex]


df= data.frame(xTrain, yTrain)
#print(df)

write.table(df, file = "05_train_jira_seed.csv", quote= FALSE, row.names= FALSE, sep = "," )


