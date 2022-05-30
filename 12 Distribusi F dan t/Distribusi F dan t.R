                                                                  ###   Distribusi F   ###


# The main functions to interact with the F distribution are df(), pf(), qf(), rf(). The df() function gives the density, 
# the pf() function gives the distribution function, the qf() function gives the quantile function, and the rf() function generates random deviates.

# We use the df() to calculate the density at the value of 1.2 of a F curve with v1=10 and v2=20.

df(1.2, df1 = 10, df2 = 20)

# We use the pf() to calculate the area under the curve for the interval [0,1.5] and the interval [1.5,+∞) of a F-curve with with v1=10 and v2=20. 
# Further we ask R if the sum of the intervals [0,1.5] and [1.5,+∞) sums up to 1

x <- 1.5
v1 <- 10
v2 <- 20

# interval $[0,1.5]
pf(x, df = v1, df2 = v2, lower.tail = TRUE)

# interval $[1.5,+inf)
pf(x, df = v1, df2 = v2, lower.tail = FALSE)

pf(x, df = v1, df2 = v2, lower.tail = TRUE) + pf(x, df = v1, df2 = v2, lower.tail = FALSE) == 1

# We use the qf() to calculate the quantile for a given area (= probability) under the curve for a F-curve with v1=10 and v2=20 that corresponds 
# to q=0.25,0.5,0.75 and 0.999. We set lower.tail = TRUE in order the get the area for the interval [0,q].

q <- c(0.25, 0.5, 0.75, 0.999)
v1 <- 10
v2 <- 20
qf(q[1], df1 = v1, df2 = v2, lower.tail = TRUE)

qf(q[2], df1 = v1, df2 = v2, lower.tail = TRUE)

qf(q[3], df1 = v1, df2 = v2, lower.tail = TRUE)

qf(q[4], df1 = v1, df2 = v2, lower.tail = TRUE)

# We use rf()function to generate 100,000 random values from the F-distribution with v1=10 and v2=20. Thereafter we plot a histogram and compare 
# it to the probability density function of the F-distribution with v1=10 and v2=20 (pink line).

x <- rf(100000, df1 = 10, df2 = 20)
hist(x, 
     breaks = 'Scott', 
     freq = FALSE, 
     xlim = c(0,3), 
     ylim = c(0,1),
     xlab = '')

curve(df(x, df1 = 10, df2 = 20), from = 0, to = 4, n = 5000, col= 'pink', lwd=2, add = T)



                                                                  ###   Distribusi t   ###



# The t-distribution is a type of probability distribution that arises while sampling a normally distributed population when the sample size is small and 
# the standard deviation of the population is unknown. It is also called the Student’s t-distribution. It is approximately a bell curve, that is, it is 
# approximately normally distributed but with a lower peak and more observations near the tail. This implies that it gives a higher probability to the tails 
# than the standard normal distribution or z-distribution (mean is 0 and the standard deviation is 1).

# Degrees of Freedom is related to the sample size and shows the maximum number of logically independent values that can freely vary in the data sample. 
# It is calculated as n – 1, where n is the total number of observations. For example, if you have 3 observations in a sample, 2 of which are 10,15 and the 
# mean is revealed to be 15 then the third observation has to be 20. So the Degrees of Freedom, in this case, is 2 (only two observations can freely vary). 
# Degrees of Freedom is important to a t-distribution as it characterizes the shape of the curve. That is, the variance in a t-distribution is estimated based 
# on the degrees of freedom of the data set. As the degrees of freedom increase, the t-distribution will come closer to matching the standard normal 
# distribution until they converge (almost identical). Therefore, the standard normal distribution can be used in place of the t-distribution with large sample 
# sizes. 

# A t-test is a statistical hypothesis test used to determine if there is a significant difference (differences are measured in means) between two groups and 
# estimate the likelihood that this difference exists purely by chance (p-value). In a t-distribution, a test statistic called t-score or t-value is used to 
# describe how far away an observation is from the mean. The t-score is used in t-tests, regression tests and to calculate confidence intervals.

# To find the value of probability density function (pdf) of the Student’s t-distribution given a random variable x, use the dt() function in R.

# Syntax: dt(x, df) 

# value of t-distribution pdf at 
# x = 0 with 25 degrees of freedom
dt(x = 1, df = 25)

# Generate a vector of 100 values between -6 and 6
x <- seq(-6, 6, length = 100)

# Degrees of freedom
df = c(1,4,10,30)
colour = c("red", "orange", "green", "yellow","black")

# Plot a normal distribution
plot(x, dnorm(x), type = "l", lty = 2, xlab = "t-value", ylab = "Density", 
     main = "Comparison of t-distributions", col = "black")

# Add the t-distributions to the plot
for (i in 1:4){
  lines(x, dt(x, df[i]), col = colour[i])
}

# Add a legend
legend("topright", c("df = 1", "df = 4", "df = 10", "df = 30", "normal"), 
       col = colour, title = "t-distributions", lty = c(1,1,1,1,2))
# Generate a vector of 100 values between -6 and 6
x <- seq(-6, 6, length = 100)

# Degrees of freedom
df = c(1,4,10,30)
colour = c("red", "orange", "green", "yellow","black")

# Plot a normal distribution
plot(x, dnorm(x), type = "l", lty = 2, xlab = "t-value", ylab = "Density", 
     main = "Comparison of t-distributions", col = "black")

# Add the t-distributions to the plot
for (i in 1:4){
  lines(x, dt(x, df[i]), col = colour[i])
}

# area to the right of a t-statistic with 
# value of 2.1 and 14 degrees of freedom
pt(q = 2.1, df = 14, lower.tail = FALSE)

# value in each tail is 2.5% as confidence is 95%
# find 2.5th percentile of t-distribution with 
# 14 degrees of freedom
qt(p = 0.025, df = 14, lower.tail = TRUE)
