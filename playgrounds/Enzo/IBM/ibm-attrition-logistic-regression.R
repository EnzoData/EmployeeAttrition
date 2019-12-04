source("pairs.r")


library(dplyr)
library(ggplot2)
library(pastecs)
library(psych)
library(Amelia)
library(mlbench)
library(corrplot)
library(caret)

# Load data
library(readr)
data <- read_csv("data/WA_Fn-UseC_-HR-Employee-Attrition.csv")
head(data)

#####################################
##
## Reformat the data so that it is
## 1) Easy to use (add nice column names)
## 2) Interpreted correctly by glm()..
##
#####################################
names(data)
summary(data)

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

str(data)
names(data)

stat.desc(data)
describe(data)

str(data)
summary(data)

attach(data)

for(i in 1:length(data)) {
  plot(Attrition, eval(parse(text=names(data)[i])), xlab = "Attrition", ylab = names(data)[i])
}

help(missmap)
options(repr.plot.width = 24, repr.plot.height = 24)
missmap(data, col=c("blue", "red"), legend=TRUE)

library(corrplot)

options(repr.plot.width = 16, repr.plot.height = 16)
num_data <- data[, sapply(data, is.numeric)]
stat.desc(num_data)
correlations <- cor(num_data)
corrplot(correlations, method="circle")

cat_data <- data[, sapply(data, is.factor)]
summary(cat_data)

pairs(data, col=data$Attrition)

#x <- num_data
#y <- data[,2]
#scales <- list(x=list(relation="free"), y=list(relation="free"))
#featurePlot(x=x, y=y, plot="density", scales=scales)

install.packages("ggplot2", dependencies = TRUE)
library(gridExtra)
library(grid)
library(ggplot2)
library(lattice)

ggplot(data=data, aes(Attrition)) + geom_histogram(stat="count") + labs(x="Attrition")
ggplot(data=data, aes(Age)) + geom_histogram(binwidth=5) + labs(x="Age")
ggplot(data=data, aes(BusinessTravel)) + geom_histogram(stat="count") + labs(x="Business Travel")
ggplot(data=data, aes(DailyRate)) + geom_histogram(binwidth=15) + labs(x="Daily Rate")
ggplot(data=data, aes(Department)) + geom_histogram(stat="count") + labs(x="Department")
ggplot(data=data, aes(DistanceFromHome)) + geom_histogram(binwidth=5) + labs(x="Distance from Home")
ggplot(data=data, aes(Education)) + geom_histogram(stat="count") + labs(x="Education")
ggplot(data=data, aes(EducationField)) + geom_histogram(stat="count") + labs(x="Education Field")
ggplot(data=data, aes(EmployeeCount)) + geom_histogram(binwidth=1) + labs(x="Employee Count")
ggplot(data=data, aes(EmployeeNumber)) + geom_histogram(binwidth=20) + labs(x="Employee Number")
ggplot(data=data, aes(EnvironmentSatisfaction)) + geom_histogram(stat="count") + labs(x="Environment Satisfaction")
ggplot(data=data, aes(Gender)) + geom_histogram(stat="count") + labs(x="Gender")
ggplot(data=data, aes(HourlyRate)) + geom_histogram(binwidth=5) + labs(x="Hourly Rate")
ggplot(data=data, aes(JobInvolvement)) + geom_histogram(stat="count") + labs(x="Job Involvement")
ggplot(data=data, aes(JobLevel)) + geom_histogram(stat="count") + labs(x="Job Level")
ggplot(data=data, aes(JobRole)) + geom_histogram(stat="count") + labs(x="Job Role")
ggplot(data=data, aes(JobSatisfaction)) + geom_histogram(stat="count") + labs(x="Job Satisfaction")
ggplot(data=data, aes(MaritalStatus)) + geom_histogram(stat="count") + labs(x="Marital Status")
ggplot(data=data, aes(MonthlyIncome)) + geom_histogram(binwidth=50) + labs(x="Monthly Income")
ggplot(data=data, aes(MonthlyRate)) + geom_histogram(binwidth=50) + labs(x="Monthly Rate")
ggplot(data=data, aes(NumCompaniesWorked)) + geom_histogram(binwidth=1) + labs(x="Num Companies Worked")
ggplot(data=data, aes(Over18)) + geom_histogram(stat="count") + labs(x="Over 18")
ggplot(data=data, aes(PercentSalaryHike)) + geom_histogram(binwidth=5) + labs(x="Percent Salary Hike")
ggplot(data=data, aes(PerformanceRating)) + geom_histogram(stat="count") + labs(x="Performance Rating")
ggplot(data=data, aes(RelationshipSatisfaction)) + geom_histogram(stat="count") + labs(x="Relationship Satisfaction")
ggplot(data=data, aes(StandardHours)) + geom_histogram(binwidth=5) + labs(x="Standard Hours")
ggplot(data=data, aes(StockOptionLevel)) + geom_histogram(stat="count") + labs(x="Stock Option Level")
ggplot(data=data, aes(TotalWorkingYears)) + geom_histogram(binwidth=5) + labs(x="Total Working Years")
ggplot(data=data, aes(TrainingTimesLastYear)) + geom_histogram(binwidth=5) + labs(x="Training Times Last Year")
ggplot(data=data, aes(WorkLifeBalance)) + geom_histogram(stat="count") + labs(x="Work Life Balance")
ggplot(data=data, aes(YearsAtCompany)) + geom_histogram(binwidth=2) + labs(x="Years At Company")
ggplot(data=data, aes(YearsSinceLastPromotion)) + geom_histogram(binwidth=2) + labs(x="Years Since Last Promotion")
ggplot(data=data, aes(YearsWithCurrManager)) + geom_histogram(binwidth=2) + labs(x="Years With Curr Manager")

#######################################
##  BUILD OUR LOGISTIC MODEL - logmod
#######################################

logmod<-glm(
  factor(Attrition) ~ 
    Age+
    factor(BusinessTravel)+
    DailyRate+
    factor(Department)+
    DistanceFromHome+
    factor(Education)+
    EducationField+
    EmployeeCount+
    EmployeeNumber+
    factor(EnvironmentSatisfaction)+
    factor(Gender)+
    HourlyRate+
    factor(JobInvolvement)+
    factor(JobLevel)+
    factor(JobRole)+
    factor(JobSatisfaction)+
    factor(MaritalStatus)+
    MonthlyIncome+
    MonthlyRate+
    NumCompaniesWorked+
    factor(OverTime)+
    PercentSalaryHike+
    factor(PerformanceRating)+
    factor(RelationshipSatisfaction)+
    StandardHours+
    factor(StockOptionLevel)+
    TotalWorkingYears+
    TrainingTimesLastYear+
    factor(WorkLifeBalance)+
    YearsAtCompany+
    YearsSinceLastPromotion+
    YearsWithCurrManager
  , data=data
  , family = binomial)
summary(logmod)

# xtabs(~Attrition + Age, data=data)
xtabs(~Attrition + BusinessTravel, data=data)
# xtabs(~Attrition + DailyRate, data=data)
xtabs(~Attrition + factor(Department), data=data)
# xtabs(~Attrition + DistanceFromHome, data=data)
xtabs(~Attrition + factor(Education), data=data)
xtabs(~Attrition + EducationField, data=data)
xtabs(~Attrition + EmployeeCount, data=data)
# xtabs(~Attrition + EmployeeNumber, data=data)
xtabs(~Attrition + factor(EnvironmentSatisfaction), data=data)
xtabs(~Attrition + factor(Gender), data=data)
# xtabs(~Attrition + HourlyRate, data=data)
xtabs(~Attrition + factor(JobInvolvement), data=data)
xtabs(~Attrition + factor(JobLevel), data=data)
xtabs(~Attrition + factor(JobRole), data=data)
xtabs(~Attrition + factor(JobSatisfaction), data=data)
xtabs(~Attrition + factor(MaritalStatus), data=data)
# xtabs(~Attrition + MonthlyIncome, data=data)
# xtabs(~Attrition + MonthlyRate, data=data)
xtabs(~Attrition + NumCompaniesWorked, data=data)
xtabs(~Attrition + factor(OverTime), data=data)
# xtabs(~Attrition + PercentSalaryHike, data=data)
xtabs(~Attrition + factor(PerformanceRating), data=data)
xtabs(~Attrition + factor(RelationshipSatisfaction), data=data)
xtabs(~Attrition + StandardHours, data=data)
xtabs(~Attrition + factor(StockOptionLevel), data=data)
# xtabs(~Attrition + TotalWorkingYears, data=data)
xtabs(~Attrition + TrainingTimesLastYear, data=data)
xtabs(~Attrition + factor(WorkLifeBalance), data=data)
# xtabs(~Attrition + YearsAtCompany, data=data)
# xtabs(~Attrition + YearsSinceLastPromotion, data=data)
# xtabs(~Attrition + YearsWithCurrManager, data=data)

logmod<-glm(
  factor(Attrition) ~ 
    Age+
    factor(BusinessTravel)+
    DistanceFromHome+
    factor(Education)+
    factor(EnvironmentSatisfaction)+
    HourlyRate+
    factor(JobInvolvement)+
    factor(JobLevel)+
    factor(JobRole)+
    factor(JobSatisfaction)+
    MonthlyIncome+
    MonthlyRate+
    NumCompaniesWorked+
    PercentSalaryHike+
    factor(PerformanceRating)+
    factor(RelationshipSatisfaction)+
    TotalWorkingYears+
    TrainingTimesLastYear+
    factor(WorkLifeBalance)+
    YearsSinceLastPromotion+
    YearsWithCurrManager
  , data=data
  , family = binomial)
summary(logmod)


#####################################
##
## Now we will use all of the data available to predict heart disease
##
#####################################

# logistic <- glm(Attrition ~ ., data=data, family="binomial")
logistic <- glm(
  factor(Attrition) ~ 
    Age+
    factor(BusinessTravel)+
    DailyRate+
    factor(Department)+
    DistanceFromHome+
    factor(Education)+
    EducationField+
    factor(EnvironmentSatisfaction)+
    factor(Gender)+
    HourlyRate+
    factor(JobInvolvement)+
    factor(JobLevel)+
    factor(JobRole)+
    factor(JobSatisfaction)+
    factor(MaritalStatus)+
    MonthlyIncome+
    MonthlyRate+
    NumCompaniesWorked+
    factor(OverTime)+
    PercentSalaryHike+
    factor(PerformanceRating)+
    factor(RelationshipSatisfaction)+
    StandardHours+
    factor(StockOptionLevel)+
    TotalWorkingYears+
    TrainingTimesLastYear+
    factor(WorkLifeBalance)+
    YearsAtCompany+
    YearsSinceLastPromotion+
    YearsWithCurrManager
  , data=data
  , family=binomial
)
summary(logistic)

## Now calculate the overall "Pseudo R-squared" and its p-value
ll.null <- logistic$null.deviance/-2
ll.proposed <- logistic$deviance/-2
ll.null
ll.proposed

## McFadden's Pseudo R^2 = [ LL(Null) - LL(Proposed) ] / LL(Null)
(ll.null - ll.proposed) / ll.null

## The p-value for the R^2
1 - pchisq(2*(ll.proposed - ll.null), df=(length(logistic$coefficients)-1))

## now we can plot the data
predicted.data <- data.frame(
  probability.of.Attrition=logistic$fitted.values,
  Attrition=data$Attrition)

predicted.data <- predicted.data[
  order(predicted.data$probability.of.Attrition, decreasing=FALSE),]
predicted.data$rank <- 1:nrow(predicted.data)
summary(predicted.data)


library(ggplot2)
## Lastly, we can plot the predicted probabilities for each sample having
## heart disease and color by whether or not they actually had heart disease
ggplot(data=predicted.data, aes(x=rank, y=probability.of.Attrition)) +
  geom_point(aes(color=Attrition), alpha=1, shape=4, stroke=2) +
  xlab("Index") +
  ylab("Predicted probability of Attrition")

ggsave("attrition_probabilities.pdf")

#### Let's find optimal subsets of features for the best model

library(leaps)
dim(data)

help(regsubsets)

regfit.full=regsubsets(
  factor(Attrition) ~ 
    Age
  + factor(BusinessTravel)
  #+ DailyRate
  #+ factor(Department)
  #+ DistanceFromHome
  + factor(Education)
  #+ EducationField
  #+ factor(EnvironmentSatisfaction)
  + factor(Gender)
  + HourlyRate
  + factor(JobInvolvement)
  # + factor(JobLevel)
  # + factor(JobRole)
  # + factor(JobSatisfaction)
  # + factor(MaritalStatus)
  #+ MonthlyIncome
  # + MonthlyRate
  # + NumCompaniesWorked
  # + factor(OverTime)
  #+ PercentSalaryHike
  #+ factor(PerformanceRating)
  #+ factor(RelationshipSatisfaction)
  #+ StandardHours
  #+ factor(StockOptionLevel)
  # + TotalWorkingYears
  #+ TrainingTimesLastYear
  #+ factor(WorkLifeBalance)
  # + YearsAtCompany
  #+ YearsSinceLastPromotion
  #+ YearsWithCurrManager
  ,data, nvmax=15, nbest=3, method="backward", really.big=T)
reg.summary<-summary(regfit.full)
names(reg.summary)

# RQS and RSS
plot(reg.summary$rsq, xlab="Number of Variables", ylab="RSquare", type="l")
plot(reg.summary$rss, xlab="Number of Variables", ylab="RSS", type="l")

plot(regfit.full,scale = "r2")
plot(regfit.full,scale = "adjr2")
plot(regfit.full,scale = "Cp")
plot(regfit.full,scale = "bic")
# coef(regfit.full, 10) #default bic

regfit.bwd=regsubsets(
  factor(Attrition) ~ 
    Age
  + factor(BusinessTravel)
  #+ DailyRate
  #+ factor(Department)
  #+ DistanceFromHome
  + factor(Education)
  #+ EducationField
  #+ factor(EnvironmentSatisfaction)
  + factor(Gender)
  + HourlyRate
  + factor(JobInvolvement)
  # + factor(JobLevel)
  # + factor(JobRole)
  # + factor(JobSatisfaction)
  # + factor(MaritalStatus)
  #+ MonthlyIncome
  # + MonthlyRate
  # + NumCompaniesWorked
  # + factor(OverTime)
  #+ PercentSalaryHike
  #+ factor(PerformanceRating)
  #+ factor(RelationshipSatisfaction)
  #+ StandardHours
  #+ factor(StockOptionLevel)
  # + TotalWorkingYears
  #+ TrainingTimesLastYear
  #+ factor(WorkLifeBalance)
  # + YearsAtCompany
  #+ YearsSinceLastPromotion
  #+ YearsWithCurrManager
  ,data=data, nvmax=15, nbest=3, method="backward")
summary(regfit.bwd)
plot(regfit.bwd,scale="Cp")
coef(regfit.bwd,which.min(summary(regfit.bwd)$cp))