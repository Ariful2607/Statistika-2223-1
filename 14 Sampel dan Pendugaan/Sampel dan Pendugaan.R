                                                                

                                                                      ###   Sampel   ###


### Simple Random Sampling ###
### Sampel acak sederhana
'
Random Sampling is one of the most popular and frequently used sampling methods. In a simple random sampling, every case in the population 
has an equal probability of getting selected in the sample.

A random sample can be obtained by labeling all the cases sequentially and generating uniform random numbers to select the cases from the 
population.

A simple random sample in R can be generated as below using the sample() function.

sample(x, size, replace = FALSE, prob = NULL)

A sample of size 10 from the numbers 1 to 10 can be generated as below.'

# mengambil sampel dimana nilainya antara 1 sampai 10 sebanyak 10 kali tanpa pengembalian
sample(1:10,10)

#dengan pengembalian
sample(1:10, replace=T)

' Let`s say we have a list with 2 items (red, green) by default both red and green have a 50% (p=0.5)chance of being selected. Suppose we 
need more reds in the sample than green it can be done by using the ‘prob’ parameter in the sample() as below'

sample(c("red","green"),10,replace=T,prob=c(0.6,0.4))

sample(c("red","green"),1,prob=c(0.6,0.4))

### Systematic Sampling ###

'
Systematic sampling is used in situations where the population data is an ordered list or is arranged in time. For eg, to analyze the average 
sales of a shop on all Sundays, systematic sampling can be used by choosing the average sales data of all the 7th day(Sunday) of the week to be 
included in the sample.

I.e, In systematic sampling, individuals are chosen at fixed intervals from the population data. To create a sample of size n from a population 
of size p fixed interval(k) is taken as p/n

i.e, k=p/n

i.e, for a population of size 1000, to create a sample of size 100 (1000/100), every 10th item from any random starting point can be chosen 
to be included in the sample.'


#install.packages("TeachingSampling")  
library(TeachingSampling)
P <- c("Mon-8", "Tues-4", "Wed-4", "Thurs-6", "Fri-7","Sat-45","Sun-34","Mon-21", "Tues-11","Wed-34","Thurs-16","Fri-10","Sat-17","Sun-19")

# systematic sample from a population of 14 with every 2nd included from the population P
systematic_sample <- S.SY(14,2)
systematic_sample
P[systematic_sample]

# Stratified Sampling

'
In stratified sampling, the population is divided into smaller subgroups based on some common factors that best describe the entire population 
like age, sex, income, etc. The groups thus formed are known as stratum/strata.

For example, to analyze the amount of time spent by male and female users in sending messages per day, the strata could be taken as male and 
female users and random sampling can be used to select items within the male and female strata.

Note: Stratified sampling gives precise estimates compared to random sampling but the biggest disadvantage is that it requires knowledge 
of the appropriate characteristics of the population(the details of which are not always available), and it can be difficult to decide which 
characteristics to stratify by.'

#1. using dplyr
library(dplyr)
iris
set.seed(1)
iris %>%
  group_by (Species) %>%
  sample_n(., 3)

#2. using strata
#install.packages("sampling") 
library(sampling)  
stratas = strata(iris, c("Species"),size = c(3,3,3), method = "srswor")
stratas

# strata method
'
srswor-simple random sampling without replacement
srswr- simple random sampling with replacement
poisson-Poisson sampling
systematic- systematic sampling
'

### Cluster Sampling ###

'
A cluster sampling is generally used in cases where the population data is geographical in nature or when there are some predefined groups 
within the population based on demographics, habits, background, etc.

In a clustered sampling, the population is first divided into small groups known as clusters and then random clusters are chosen to create 
a sample.

To perform cluster sampling we have used below the Elementary School Teacher Workload dataset of the SDaA package. The workload dataset 
contains the workload details such as hours worked, preparation time, etc of teachers of different schools across different districts.'

#install.packages("SDaA")
library(SDaA)
data("teachers")
head(teachers)

#list of all the school_ids 
unique(teachers[,2])

#creating a cluster sample with 7 randomly selected clusters.
#Here we have formed clusters using the school variable.Hence each cluster contains the workload data of 7 randomly selected schools.
set.seed(123456)
cl=cluster(teachers,clustername=c("school"),size=7,method="srswor")
cl_data = getdata(teachers, cl)

head(cl_data)

#list of the randomly selected schools
unique(cl_data[,6])

#count of workload details within each school clusters
table(cl_data$school)

#random sampling of clusters with a sample size of 5, so that each cluster contains 5 randomly selected workload details per school cluster.
cl_sam <- cl_data %>% group_by(school) %>% sample_n(size = 5)

#Each of the 7 clusters have 5 randomly selected workload data.
table(cl_sam$school)


                                                                     ###   Pendugaan   ###


'
It is a common requirement to efficiently estimate population parameters based on simple random sample data. In the R tutorials of this section, 
we demonstrate how to compute the estimates. The steps are to be illustrated with a built-in data frame named survey. It is the outcome of 
a Statistics student survey in an Australian university.

The data set belongs to the MASS package, which has to be pre-loaded into the R workspace prior to use.
'

library(MASS)      # load the MASS package 
head(survey) 


# Point Estimate of Population Mean

'For any particular random sample, we can always compute its sample mean. Although most often it is not the actual population mean, it does 
serve as a good point estimate. For example, in the data set survey, the survey is performed on a sample of the student population. We can 
the sample mean and use it as an estimate of the corresponding population parameter.'

height.survey = survey$Height
mean(height.survey, na.rm=TRUE)  # skip missing values

# Interval Estimate of Population Mean with Known Variance

'
After we found a point estimate of the population mean, we would need a way to quantify its accuracy. Here, we discuss the case where the 
population variance σ2 is assumed known.

Let us denote the 100(1 −α∕2) percentile of the standard normal distribution as zα∕2. For random sample of sufficiently large size, the end 
points of the interval estimate at (1 − α) confidence level is given as follows: 

Assume the population standard deviation σ of the student height in survey is 9.48. Find the margin of error and interval estimate at 95% 
confidence level. 
'

height.response = na.omit(survey$Height)
n = length(height.response) 
sigma = 9.48                   # population standard deviation 
sem = sigma/sqrt(n); sem       # standard error of the mean 

E = qnorm(.975)*sem; E         # margin of error
xbar = mean(height.response)   # sample mean 
xbar + c(-E, E) 

'Assuming the population standard deviation σ being 9.48, the margin of error for the student height survey at 95% confidence level is 
1.2852 centimeters. The confidence interval is between 171.10 and 173.67 centimeters.'

# Interval Estimate of Population Mean with Unknown Variance
'After we found a point estimate of the population mean, we would need a way to quantify its accuracy. Here, we discuss the case where the 
population variance is not assumed.

Let us denote the 100(1 −α∕2) percentile of the Student t distribution with n− 1 degrees of freedom as tα∕2. For random samples of 
sufficiently large size, and with standard deviation s, the end points of the interval estimate at (1 −α) confidence level'

height.response = na.omit(survey$Height)
n = length(height.response) 
s = sd(height.response)        # sample standard deviation 
SE = s/sqrt(n); SE             # standard error estimate 
E = qt(.975, df=n-1)*SE; E     # margin of error 
xbar = mean(height.response)   # sample mean 
xbar + c(-E, E) 

'Without assumption on the population standard deviation, the margin of error for the student height survey at 95% confidence level 
is 1.3429 centimeters. The confidence interval is between 171.04 and 173.72 centimeters. '