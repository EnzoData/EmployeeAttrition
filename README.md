# Employee Attrition Analysis

### Problem Statement

A large company named IBM, employs, at any given point of time, around 4000 employees. 
However, every year, around 15% of its employees leave the company and need to be replaced 
with the talent pool available in the job market. The management believes that this level 
of attrition (employees leaving, either on their own or because they got fired) is bad for 
the company, because of the following reasons:

1. The former employees' projects get delayed, which makes it difficult to meet timelines, 
resulting in a reputation loss among consumers and partners

2. A sizeable department has to be maintained, for the purposes of recruiting new talent

3. More often than not, the new employees have to be trained for the job and/or given time 
to acclimatize themselves to the company

Hence, the management has contracted us to understand what factors they should focus on, in 
order to curb attrition. In other words, they want to know what changes they should make to 
their workplace, in order to get most of their employees to stay. Also, they want to know 
which of these variables is most important and needs to be addressed right away.

### Goal of the Case Study

We aim to model the probability of attrition using logistic regression. The results thus obtained 
will be used by management within an organization to understand what changes they should make to 
their workplace, in order to get most of their employees to stay.

Uncover the factors that lead to employee attrition and explore important questions such as `show me a breakdown of distance from home by job role and attrition` or `compare average monthly income by education and attrition`. This is a fictional data set created by IBM data scientists.

Education 1 'Below College' 2 'College' 3 'Bachelor' 4 'Master' 5 'Doctor'

EnvironmentSatisfaction 1 'Low' 2 'Medium' 3 'High' 4 'Very High'

JobInvolvement
1 'Low' 2 'Medium' 3 'High' 4 'Very High'

JobSatisfaction 1 'Low' 2 'Medium' 3 'High' 4 'Very High'

PerformanceRating
1 'Low' 2 'Good' 3 'Excellent' 4 'Outstanding'

RelationshipSatisfaction
1 'Low' 2 'Medium' 3 'High' 4 'Very High'

WorkLifeBalance 1 'Bad' 2 'Good' 3 'Better' 4 'Best'

### Data Sources

All data sources are available for download [here](https://www.kaggle.com/pavansubhasht/ibm-hr-analytics-attrition-dataset).

#### [WA_Fn-UseC_-HR-Employee-Attrition.csv (35 columns)](https://www.kaggle.com/pavansubhasht/ibm-hr-analytics-attrition-dataset#WA_Fn-UseC_-HR-Employee-Attrition.csv) Contains employee attrition data


### Columns

**Age Numérica - Discrete**
![Age](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/Age.png)
    
**Attrition Categorical**
![Attrition](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/Attrition.png)

**BusinessTravel Categorical**
![BusinessTravel](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/BusinessTravel.png)

**DailyRate Numeric - Discrete**
![DailyRate](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/DailyRate.png)

**Department Categorical**
![Department](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/Department.png)

**DistanceFromHome Numeric - Discrete**
![DistanceFromHome](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/DistanceFromHome.png)

**Education Categorical**
![Education](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/Education.png)

**EducationField Categorical**
![EducationField](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/EducationField.png)

**EmployeeCount Numeric - Discrete**
![EmployeeCount](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/EmployeeCount.png)

**EmployeeNumber Numeric - Discrete**
![EmployeeNumber](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/EmployeeNumber.png)

**EnvironmentSatisfaction Categorical**
![EnvironmentSatisfaction](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/EnvironmentSatisfaction.png)

**Gender Categorical**
![Gender](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/Gender.png)

**HourlyRate Numeric - Discrete**
![HourlyRate](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/HourlyRate.png)

**JobInvolvement Categorical**
![JobInvolvement](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/JobInvolvement.png)

**JobLevel Categorical**
![JobLevel](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/JobLevel.png)

**JobRole Categorical**
![JobRole](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/JobRole.png)

**JobSatisfaction Categorical**
![JobSatisfaction](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/JobSatisfaction.png)

**MaritalStatus Categorical**
![MaritalStatus](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/MaritalStatus.png)

**MonthlyIncome Numeric - Discrete**
![MonthlyIncome](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/MonthlyIncome.png)

**MonthlyRate Numeric - Discrete**
![MonthlyRate](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/MonthlyRate.png)

**NumCompaniesWorked Numeric - Discrete**
![NumCompaniesWorked](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/NumCompaniesWorked.png)

**Over18 Categorical**
![Over18](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/Over18.png)

**OverTime Categorical**
![OverTime](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/OverTime.png)

**PercentSalaryHike Numeric - Discrete**
![PercentSalaryHike](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/PercentSalaryHike.png)

**PerformanceRating Categorical**
![PerformanceRating](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/PerformanceRating.png)

**RelationshipSatisfaction Categorical**
![RelationshipSatisfaction](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/RelationshipSatisfaction.png)

**StandardHours Numeric - Discrete**
![StandardHours](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/StandardHours.png)

**StockOptionLevel Categorical**
![StockOptionLevel](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/StockOptionLevel.png)

**TotalWorkingYears Numeric - Discrete**
![TotalWorkingYears](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/TotalWorkingYears.png)

**TrainingTimesLastYear Numeric - Discrete**
![TrainingTimesLastYear](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/TrainingTimesLastYear.png)

**WorkLifeBalance Categorical**
![WorkLifeBalance](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/WorkLifeBalance.png)
    
**YearsAtCompany Numeric - Discrete**
![YearsAtCompany](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/YearsAtCompany.png)

**YearsAtCompany Numeric - Discrete**
![YearsAtCompany](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/YearsAtCompany.png)

**YearsSinceLastPromotion Numeric - Discrete**
![YearsSinceLastPromotion](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/YearsSinceLastPromotion.png)

**YearsWithCurrManager Numeric - Discrete**
![YearsWithCurrManager](https://github.com/matthewzimmer/minimal-mistakes-ibm-hr-analytics-attrition-dataset/raw/master/data/feature-distributions/YearsWithCurrManager.png)
