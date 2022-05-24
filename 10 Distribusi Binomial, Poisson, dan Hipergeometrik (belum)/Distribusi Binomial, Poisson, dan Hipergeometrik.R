

                                                                ###   Distribusi Binomial   ###


# Binomial distribution in R is a probability distribution used in statistics. The binomial distribution is a discrete distribution and has only two outcomes 
# i.e. success or failure. All its trials are independent, the probability of success remains the same and the previous outcome does not affect the next 
# outcome. The outcomes from different trials are independent. Binomial distribution helps us to find the individual probabilities as well as 
# cumulative probabilities over a certain range.

# It is also used in many real-life scenarios such as in determining whether a particular lottery ticket has won or not, whether a drug is able to cure a 
# person or not, it can be used to determine the number of heads or tails in a finite number of tosses, for analyzing the outcome of a die, etc.

# We have four functions for handling binomial distribution in R namely:

# dbinom(k, n, p) -> probability binomial distribution
# pbinom(k, n, p) -> cumulative probability of binomial distribution
# qbinom(P, n, p) -> used to find the nth quantile
# rbinom(n, N, p) -> generates n random variables of a particular probability

# Calculate probability binomial distribution
dbinom(3, size = 13, prob = 1 / 6)
probabilities <- dbinom(x = c(0:10), size = 10, prob = 1 / 6)
data.frame(probabilities)

#Plot binomial distribution
plot(0:10, probabilities, type = "l")

# Calculate cumulative probability binomial distribution
pbinom(3, size = 13, prob = 1 / 6)

# plot cumulative distribution
plot(0:10, pbinom(0:10, size = 10, prob = 1 / 6), type = "l")

#find quantile
qbinom(0.8419226, size = 13, prob = 1 / 6)

x <- seq(0, 1, by = 0.1)
y <- qbinom(x, size = 13, prob = 1 / 6)

plot(x, y, type = 'l')

# Contoh Soal

# Seorang penjual mengatakan bahwa di antara seluruh barang  dagangannya yang sudah dikemas rapi, ada yang rusak sebanyak  20%. Seorang pelanggan, membeli 
# barang tersebut sebanyak 8 buah yang dipilihnya secara acak. Jika 𝑋 = banyaknya barang yang tidak rusak, hitunglah probabilitasnya bahwa dari 
# 8 barang yang dibeli terdapat 5 yang rusak. (Jawaban : 0,0092)

px <- .2 # Probabilitas barang rusak 20%
n <- 8 # Pembelian 8 buah barang
X <- 5 # barang yang rusakk

dbinom(X, size = n, prob = px)


                                                                ###   Distribusi Poisson   ###


# The Poisson distribution represents the probability of a provided number of cases happening in a set period of space or time if these cases happen 
# with an identified constant mean rate (free of the period since the ultimate event). Poisson distribution has been named after Siméon Denis Poisson
# (French Mathematician). 

# Many probability distributions can be easily implemented in R language with the help of R’s inbuilt functions. There are four Poisson functions 
# available in R:

# dpois (x,lambda,log) -> probability of a random variable using poisson distribution
# ppois(q,lambda,lower.tail,log) -> cumulative probability function of poisson distribution
# rpois(n,lambda) -> generating random numbers from a given Poisson’s distribution
# qpois(q,lambda,lower.tail,log) -> generating quantile of a given Poisson’s distribution

dpois(2, 3)
dpois(6, 6)

ppois(2, 3)
ppois(6, 6)

rpois(2, 3)
rpois(6, 6)

y <- c(.01, .05, .1, .2)
qpois(y, 2)
qpois(y, 6)

# Contoh 1

# Seseorang yang akan menjual mobil mewahnya memasang iklan pada  suatu surat kabar yang dapat menjangkau 100.000 pembaca. Dengan  asumsi nilai 
# probabilitas bahwa seorang pembaca yang membaca iklan akan berminat membeli mobil adalah 𝑠 =  1/50.000. Jika 𝑋 = banyaknya pembaca yang 
# berminat membeli mobil, hitunglah 𝑃(𝑋 = 0), 𝑃(𝑋 = 1), 𝑃(𝑋 = 2), 𝑃(𝑋 = 3), 𝑃(𝑋 = 4), … !

# Jawaban
# 𝑃(𝑋 = 0) = p(0) = 0,1353
# 𝑃(𝑋 = 1) = p(1) = 0.2707
# 𝑃(𝑋 = 2) = p(2) = 0.2707
# 𝑃(𝑋 = 3) = p(3) = 0.1804
# 𝑃(𝑋 = 4) = p(4) = 0.0902
# ...

N <- 100000 # jumlah sampel yaitu target pembaca
s <- 1/50000 # probabilitas berminat

lambda <- N*s # 𝜆 = rata-rata distribusi = 𝐸 (𝑋) = 𝑛.𝑠 = 2.

X <- c(0,1,2,3,4) #Membuat vektor untuk X0, X1, X2, X3, X4.

dpois(X,lambda)

# Contoh 2

# Pada sebuah program promosi penjualan rokok, di antara 1000 batang  rokok terdapat 5 batang yang bertuliskan ”BERHADIAH”. Apabila X 
# menyatakan banyaknya batang rokok yang bertuliskan ”BERHADIAH”  dalam satu bungkus rokok, dimana setiap bungkus berisi 20 batang,  
# berapakah 𝑃(𝑋 = 0), 𝑃(𝑋 = 1), 𝑃(𝑋 = 2), 𝑃(𝑋 = 3), 𝑃(𝑋 = 4)? 

# Jawaban
# 𝑃(𝑋 = 0) = p(0) = 0.9048
# 𝑃(𝑋 = 1) = p(1) = 0.0905
# 𝑃(𝑋 = 2) = p(2) = 0.0045
# 𝑃(𝑋 = 3) = p(3) = 0.0002
# 𝑃(𝑋 = 4) = p(4) = 0.0000

N <- 1000 # populasi dalam 1000 batang rokok
n <- 20 # sampel dalam bungkus rokok yang berisi 20 batang
s <- 5/N # probabilitas 5 batang berhadiah dalam 1000 batang rokok

lambda <- n*s
X <- c(0,1,2,3,4)

dpois(X,lambda)

# Contoh 3

# Seorang kepala bagian kredit sebuah bank beranggapan bahwa 4%  dari para nasabah merasa tidak puas dengan pelayanan bank tersebut. 
# Kemudian 50 orang nasabah dipilih secara acak. Jika 𝑋 =  banyaknya nasabah yang tidak puas, hitunglah 𝑝_𝑟 (𝑥), untuk 𝑥 = 0, 1, 2, …, 9 
# dan hitunglah distribusi kumulatif 𝐹(𝑥) = 𝑃(𝑋 ≤ 𝑥)

# Jawaban
# 𝑃(𝑋 = 0) = p(0) = 0,1353
# 𝑃(𝑋 = 1) = p(1) = 0,4060
# 𝑃(𝑋 = 2) = p(2) = 0,6767
# 𝑃(𝑋 = 3) = p(3) = 0,8571
# 𝑃(𝑋 = 4) = p(4) = 0,9473
# 𝑃(𝑋 = 5) = p(5) = 0,9843
# 𝑃(𝑋 = 6) = p(6) = 0,9954
# 𝑃(𝑋 = 7) = p(7) = 0,9988
# 𝑃(𝑋 = 8) = p(8) = 0,9997
# 𝑃(𝑋 = 9) = p(9) = 0,9999

s <- .04
n <- 50

lambda <- n*s
X <- c(0,1,2,3,4,5,6,7,8,9)

ppois (X,lambda)


                                                              ###   Distribusi Hipergeometrik   ###


# Hypergeometric Distribution in R Language is defined as a method that is used to calculate probabilities when sampling without replacement 
# is to be done in order to get the density value.

# In R, there are 4 built-in functions to generate Hypergeometric Distribution:

# dhyper(x, m, n, k) -> Hypergeometric Density Distribution used in order to get the density value
# phyper(x, m, n, k) -> Hypergeometric Cumulative Distribution Function
# qhyper(x, m, n, k) -> Hypergeometric Quantile Function
# rhyper(N, m, n, k) -> generating random numbers function by specifying a seed and sample size


# Specify x-values for dhyper function
x_dhyper <- seq(0, 22, by = 1)

# Apply dhyper function
y_dhyper <- dhyper(x_dhyper, m = 45, n = 30, k = 20)   

# Plot dhyper values
plot(y_dhyper)

# Specify x-values for phyper function
x_phyper <- seq(0, 22, by = 1)    

# Apply phyper function
y_phyper <- phyper(x_phyper, m = 40, n = 20, k = 31)  

# Plot phyper values
plot(y_phyper)

# Specify x-values for qhyper function
x_qhyper <- seq(0, 1, by = 0.02)        

# Apply qhyper function
y_qhyper <- qhyper(x_qhyper, m = 49, n = 18, k = 30)    

# Plot qhyper values
plot(y_qhyper)

# Set seed for reproducibility
# Specify sample size
set.seed(400)                                 
N <- 10000                                      

# Draw N hypergeometrically distributed values
y_rhyper <- rhyper(N, m = 50, n = 20, k = 30) 
y_rhyper         

# Plot of randomly drawn hyper density
hist(y_rhyper,                                          
     breaks = 50,
     main = "")

# Contoh

# Sebuah anggota komite terdiri dari 5 orang: 3 wanita dan 2 laki-laki.  Misalkan 2 dari 5 anggota komite tersebut dipilih untuk menjadi 
# delegasi dalam sebuah konferensi.
# 1. Berapa probabilitas bahwa dari pemilihan secara acak didapat 2  orang wanita?
# 2. Berapa probabilitas dari 2 orang yang terpilih adalah 1 laki-laki  dan 1 perempuan?

N <- 5
n <- 2
r <- 3

x1 <- 2
x2 <- 1

dhyper(x1, m = N, n = n, k = r) 
phyper(x2, m = N, n = n, k = r)
