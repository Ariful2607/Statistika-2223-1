
                          ###   DASAR DASAR R   ###

# Mendefinisikan variabel
myString <- "Hello, World!" # X = 0 | X <- 0
print(myString)

# membuat vector
apple <- c('red','green',"yellow") 
number <- c(1,2,3)
print(apple)
print(number)

# cek class vector
print(class(apple))
print(class(number))

#membuat list
list1 <- list(c(2,5,3),21.3,sin)
print(list1)

# membuat array
a <- array(c('green','yellow'), dim = c(3,3,1)) # x=3, y=3, z=1
print(a)

# membuat data frame
BMI <- 	data.frame(
  gender = c("Male", "Male","Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age = c(42,38,26)
)
print(BMI)

#Silahkan pelajari lebih lanjut : https://www.tutorialspoint.com/r/

                        ###   VARIABEL ACAK   ###

#Fungsi dasar untuk menggambar sampel acak dari kumpulan elemen tertentu 
#adalah fungsi sample()
sample(1:10,1)
sample(5:50,10)

# Probabilitas melempar 1 buah dadu #mata dadu ada 6 p(x)=1/6
sample(1:6, 1)
probability <- rep(1/6,6) #replicate 1/6 (probabilitas) sebanyak 6kali
print(probability)

# plot probabilitas
plot(probability,
     xlab = "Hasil",
     main = "Distribusi Probabilitas") 

# membuat probabilitas kumulatif
cum_probability <- cumsum(probability)
print(cum_probability)

# plot probabilitas kumulatif
plot(cum_probability, 
     xlab = "outcomes", 
     main = "Distribusi Probabilitas Kumulatif")

                        ###   NILAI HARAPAN   ###

# Misal X = banyaknya pesanan barang dalam satuan yang masuk selama
# 1 minggu. P(X) = probabilitas terjadinya X = x

#    X    |   P(x)
#    0    |   0,18
#    1    |   0,34
#    2    |   0,35
#    3    |   0,11
#    4    |   0,02

# E(X) = 1,45

vals <- c(0, 1, 2, 3, 4)
probs <- c(.18, .34, .35, .11, .02)

# Metode 1
sum(vals*probs)
# Nilai harapan = hasil penjumlahan dari perkalian X terhadap P(X)

# Metode 2
weighted.mean(vals, probs)

# Metode 3
c(vals %*% probs)