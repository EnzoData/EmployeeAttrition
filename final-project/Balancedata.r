install.packages("ROSE")

#balancing data:
#what to do if number of 1's is much smaller than the number of 0's
#find the indeces corresponding to 0s, and 1's
input_ones <- mydata[which(mydata$Y == 1), ]  # all 1's
input_zeros <- mydata[which(mydata$Y == 0), ]  # all 0's

#reduce the number of 0's by selecting a sample at random of the size of the 1's you have. 
#you can have a different proportion. I made it 50:50 but use your judgement. 
#Perhaps you want 1:2 ratio to include more cases.
set.seed(100)  # for repeatability of samples
which.zeros<- sample(1:nrow(input_zeros), nrow(input_ones))
sample.from.zeros<-input_zeros[which.zeros,]
#put the data together:
balanced.data<-rbind(input_ones,sample.from.zeros)

#Altenatively, you can leave the zeros as they are and resample the 1's
set.seed(100)  # for repeatability of samples
which.ones<- sample(1:2*nrow(input_ones), nrow(input_zeros),replace=TRUE)
resample.ones<-input_ones[which.ones,]
balanced.data<-rbind(resample.ones,input_zeros)

#another way: sake a sample of the same zise for both (p=.5), total samples=3000
#  "both" oversamples minority(1's) and undersamples mayority(0's)
library(ROSE)
balanced.data<-ovun.sample(Y~.,data=mydata,method="both",p=0.5,N=3000,seed=1)$data

