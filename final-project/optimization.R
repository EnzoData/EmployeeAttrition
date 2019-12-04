source("pairs.r")


library(dplyr)
library(ggplot2)
library(pastecs)
library(psych)
library(Amelia)
library(mlbench)
library(corrplot)
library(caret)
library(readr)
library(gridExtra)
library(grid)
library(ggplot2)
library(lattice)
library(leaps)

data <- read_csv("data/WA_Fn-UseC_-HR-Employee-Attrition.csv")

data$Attrition <- ifelse(data$Attrition == "Yes", 1, 0)
data$Attrition <- factor(data$Attrition, levels = c(0, 1))

data$Over18 <- ifelse(data$Over18 == "Y", 1, 0)
data$Over18 <- factor(data$Over18, levels = c(0, 1))

data$OverTime <- ifelse(data$OverTime == "Yes", 1, 0)
data$OverTime <- factor(data$OverTime, levels = c(0, 1))

data$BusinessTravel<-factor(data$BusinessTravel)
data$Department<-factor(data$Department)
data$EducationField<-factor(data$EducationField)
data$Gender<-factor(data$Gender)
data$MaritalStatus<-factor(data$MaritalStatus)
data$JobRole<-factor(data$JobRole)

data$Education<-factor(data$Education, order = TRUE, levels=c(1,2,3,4,5))
data$EnvironmentSatisfaction<-factor(data$EnvironmentSatisfaction, order=TRUE, levels=c(1,2,3,4))
data$JobInvolvement<-factor(data$JobInvolvement, order=TRUE, levels=c(1,2,3,4))
data$JobSatisfaction<-factor(data$JobSatisfaction, order=TRUE, levels=c(1,2,3,4))
data$PerformanceRating<-factor(data$PerformanceRating, order=TRUE, levels=c(1,2,3,4))
data$RelationshipSatisfaction<-factor(data$RelationshipSatisfaction, order=TRUE, levels=c(1,2,3,4))
data$WorkLifeBalance<-factor(data$WorkLifeBalance, order=TRUE, levels=c(1,2,3,4))
data$StockOptionLevel<-factor(data$StockOptionLevel, order=TRUE, levels=c(0,1,2,3))

original.data<-data

#### Balance Data
#balancing data:
#what to do if number of 1's is much smaller than the number of 0's
#find the indeces corresponding to 0s, and 1's
input_ones <- data[which(data$Attrition == 1), ]  # all 1's
input_zeros <- data[which(data$Attrition == 0), ]  # all 0's

#reduce the number of 0's by selecting a sample at random of the size of the 1's you have. 
#you can have a different proportion. I made it 50:50 but use your judgement. 
#Perhaps you want 1:2 ratio to include more cases.
#set.seed(100)  # for repeatability of samples
#which.zeros<- sample(1:nrow(input_zeros), nrow(input_ones))
#sample.from.zeros<-input_zeros[which.zeros,]
#put the data together:
#balanced.data<-rbind(input_ones,sample.from.zeros)

#Altenatively, you can leave the zeros as they are and resample the 1's
#set.seed(100)  # for repeatability of samples
#which.ones<- sample(1:2*nrow(input_ones), nrow(input_zeros),replace=TRUE)
#resample.ones<-input_ones[which.ones,]
#balanced.data<-rbind(resample.ones,input_zeros)

#another way: sake a sample of the same zise for both (p=.5), total samples=3000
#  "both" oversamples minority(1's) and undersamples mayority(0's)
library(ROSE)
balanced.data<-ovun.sample(Attrition~.,data=data,method="both",p=0.5,N=3000,seed=1)$data
#View(balanced.data)

data<-balanced.data

logmod <- glm(
  factor(Attrition) ~ 
    Age
  + factor(BusinessTravel) * DistanceFromHome * factor(MaritalStatus) * factor(WorkLifeBalance)
  + DailyRate
  + factor(Department)
  + factor(Education) * EducationField
  + factor(JobInvolvement) * factor(JobLevel) * factor(JobSatisfaction)
  + factor(EnvironmentSatisfaction) * factor(Gender) * factor(JobRole)
  + MonthlyIncome * HourlyRate * factor(OverTime)
  + NumCompaniesWorked
  + factor(PerformanceRating)
  + factor(RelationshipSatisfaction)
  + factor(StockOptionLevel) * TotalWorkingYears * TrainingTimesLastYear
  + PercentSalaryHike * YearsAtCompany * YearsSinceLastPromotion * YearsWithCurrManager
  , data=data
  , family=binomial
)
AIC(logmod)
BIC(logmod)