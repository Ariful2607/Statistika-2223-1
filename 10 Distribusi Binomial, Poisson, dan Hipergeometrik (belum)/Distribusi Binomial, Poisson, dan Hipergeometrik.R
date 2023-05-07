

                                                                ###   Distribusi Binomial   ###


# Terdapat empat fungsi distribusi binomial pada R yaitu:

# dbinom(k, n, p) -> distribusi probabilitas binomial
# pbinom(k, n, p) -> distribusi probabilitas binomial kumulatif
# qbinom(P, n, p) -> digunakan untuk mencari kuantil ke-n
# rbinom(n, N, p) -> menghasilkan n variabel acak dari probabilitas tertentu

### Keterangan
# x: jumlah sukses/gagal
# n: jumlah sampel/percobaan
# p: probabilitas sukses/gagal

# Misal dalam pelemparan dadu sebanyak 10 kali, kemungkinan mata dadu 6 muncul
# sebanyak tiga kali adalah sebagai berikut
dbinom(3, size = 10, prob = 1 / 6) 

# Apabila menggunakan vector kemunculan mulai dari 0 s/d 10 kali 
kemungkinan <- dbinom(x = c(0:10), size = 10, prob = 1 / 6)
data.frame(kemungkinan)

#Plot distribusi binomial 
plot(0:10, kemungkinan, type = "l")

# Menghitung distribusi probabilitas binomial kumulatif
pbinom(1, size = 10, prob = 1 / 6)

# plot distribusi kumulatif
plot(0:10, pbinom(0:10, size = 10, prob = 1 / 6), type = "l")


# Contoh Soal

# Seorang penjual mengatakan bahwa di antara seluruh barang  dagangannya yang sudah dikemas rapi, ada yang rusak sebanyak  20%. Seorang pelanggan, membeli 
# barang tersebut sebanyak 8 buah yang dipilihnya secara acak. Jika 𝑋 = banyaknya barang yang tidak rusak, hitunglah probabilitasnya bahwa dari 
# 8 barang yang dibeli terdapat 5 yang rusak. (Jawaban : 0,0092)

px <- .2 # Probabilitas barang rusak 20%
n <- 8 # Pembelian 8 buah barang
X <- 5 # barang yang rusak

dbinom(X, size = n, prob = px)


                                                                ###   Distribusi Poisson   ###


# Terdapat empat fungsi distribusi Poisson pada R yaitu:
# dpois (x,lambda) 
# ppois (q,lambda) 
# rpois (n,lambda) 
# qpois (q,lambda)

#lambda <- N*s

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


# Pada R, terdapat 4 fungsi distribusi Hipergeometrik:

# dhyper(x, s, g, n) 
# phyper(x, s, g, n) 
# qhyper(x, s, g, n) 
# rhyper(N, s, g, n)

### Keterangan
# x: jumlah sukses
# s: jumlah populasi sukses
# g: jumlah populasi gagal
# n: jumlah sampel/percobaan


# Contoh

# Sebuah anggota komite terdiri dari 5 orang: 3 wanita dan 2 laki-laki.  Misalkan 2 dari 5 anggota komite tersebut dipilih untuk menjadi 
# delegasi dalam sebuah konferensi.
# 1. Berapa probabilitas bahwa dari pemilihan secara acak didapat 2  orang wanita? (Jawab:0.3)
# 2. Berapa probabilitas dari 2 orang yang terpilih adalah 1 laki-laki  dan 1 perempuan? (Jawab:0.6)

s <- 3 #Sukses disini jika wanita terpilih sehingga bernilai 3
g <- 2 #Gagal disini jika laki-laki terpilih sehingga bernilai 2
n <- 2 #Jumlah anggota yang dipilih

x1 <- 2 #Dipilih 2 wanita 0 laki-laki
x2 <- 1 #Dipilih 1 wanita 1 laki-laki

dhyper(x1, s, g, n) 
dhyper(x2, s, g, n) 
