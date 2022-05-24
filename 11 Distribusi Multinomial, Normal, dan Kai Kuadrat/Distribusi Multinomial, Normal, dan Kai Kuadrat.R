
                    ###   Distribusi Multinomial   ###


# The multinomial distribution describes the probability of obtaining a 
# specific number of counts for k different outcomes, when each outcome 
# has a fixed probability of occurring. independen

# If a random variable X follows a multinomial distribution, then the 
# probability that outcome 1 occurs exactly x1 times, outcome 2 occurs exactly 
# x2 times, etc.

# To calculate a multinomial probability in R we can use the dmultinom() 
# function, which uses the following syntax:
  
dmultinom(x=c(1, 6, 8), prob=c(.4, .5, .1))

# where:
# x    : A vector that represents the frequency of each outcome
# prob : A vector that represents the probability of each outcome 
#        (the sum must be 1)

# Example

# Proses pembuatan pensil dalam sebuah pabrik melibatkan banyak buruh dan 
# dilakukan berulang-ulang. Pada suatu pemeriksaan terakhir terlihat bahwa 85% 
# produk adalah ”baik”, 10% ”tidak baik tetapi masih bisa diperbaiki” dan 5% 
# ”rusak dan harus dibuang”. Jika sebuah sampel acak dengan 20 unit dipilih, 
# berapa peluang jumlah unit ”baik” sebanyak 18, unit ”tidak baik tetapi bisa 
# diperbaiki” sebanyak 2 dan unit ”rusak” tidak ada? (Jawaban : 0,102)

p_x1 = 0.85
p_x2 = 0.1
p_x3 = 0.05
n = 20
x1 = 18
x2 = 2
x3 = 0

dmultinom(x=c(x1, x2, x3), prob=c(p_x1, p_x2, p_x3))


                      ###   Distribusi Normal   ###


# Normal Distribution is a probability function used in statistics that tells 
# about how the data values are distributed. It is the most important 
# probability distribution function used in statistics because of its advantages 
# in real case scenarios. For example, the height of the population, shoe size, 
# IQ level, rolling a dice, and many more.

# In R, there are 4 built-in functions to generate normal distribution:

# dnorm(x, mean, sd) -> density function of distribution
# pnorm(x, mean, sd) -> cumulative distribution function
# qnorm(p, mean, sd) -> inverse pnorm, to find percentiles
# rnorm(n, mean, sd) -> generate a vector of random numbers which are 
#                       normally distributed

# creating a sequence of values between -15 to 15 with a difference of 0.1
x = seq(-15, 15, by=0.1)
y = dnorm(x, mean(x), sd(x))

# output to be present as PNG file
png(file="dnormExample.png")

# Plot the graph.
plot(x, y)

# saving the file
dev.off() 

# Example

# Sebuah laptop dengan merk X, mengklaim bahwa lamanya waktu ketahanan daya 
# baterai didistribusikan secara normal dengan rata-rata adalah 5 jam dan 
# standar deviasi 1,5 jam. Bejo membeli laptop tersebut dan ingin mengetahui 
# ketahanan daya baterai laptop tersebut untuk penggunaan normal. Bantulah Bejo 
# untuk menghitung probabilitas laptop tersebut dapat bertahan 6 jam!

rata2 <- 5
std <- 1.5
x <- 6

sb_x = seq(-rata2, rata2, by=0.1)
sb_y <- dnorm(sb_x,mean(sb_x),sd(sb_x))

png(file="contoh_normal.png")
plot(sb_x, sb_y)
dev.off()

prob <- dnorm(x,rata2,std)
prob


                  ###   Distribusi Kai Kuadrat   ###


# The chi-squared distribution with df degrees of freedom is the distribution 
# computed over the sums of the squares of df independent standard normal 
# random variables. This distribution is used for the categorical analysis of 
# the data.

# In R, there are 4 built-in functions to generate chi-squared distribution:

# qchisq() -> quantile function
# dchisq() -> density function
# pchisq() -> distribution function
# rchisq() -> random numbers from the chi-square distribution

# defining degrees of freedom
df = 5 #tingkat kesalahan yang dapat ditolerir maksimal 5%

# computing values of 50k random values with 5 degrees of freedom
x <- rchisq(50000, df = 5)

hist(x, 
     freq = FALSE, 
     xlim = c(0,16), 
     ylim = c(0,0.2))

curve(dchisq(x, df = 5), from = 0, to = 15, 
      n = 5000, col= 'red', lwd=2, add = T)
