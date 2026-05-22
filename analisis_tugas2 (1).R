# =========================
# LOAD LIBRARY
# =========================
library(readxl)
library(psych)
library(tidyverse)

# =========================
# MEMBACA DATA
# =========================
data <- read_excel("C:/Users/MyBook14E/OneDrive - UGM 365/Documents/ABYAN/Kuliah/Survei Penggunaan Spotify_Music Streaming terhadap Produktivitas Belajar Mahasiswa   (Responses) - Form Responses 1 - Copy.xlsx")

# Melihat data
View(data)

# =========================
# STRUKTUR DATA
# =========================
str(data)

# Mengubah semua variabel menjadi numerik
data <- data %>%
  mutate(across(everything(), as.numeric))

# =========================
# RUMUS SLOVIN
# =========================

# Jumlah populasi
N <- 157

# Tingkat kesalahan
e <- 0.10

# Menghitung ukuran sampel
n <- N / (1 + N * e^2)

# Menampilkan hasil Slovin
n

# Membulatkan hasil
ceiling(n)

# =========================
# MEMILIH ITEM PERTANYAAN
# =========================
item <- data[, 1:10]

# =========================
# UJI VALIDITAS
# =========================

# Menghitung total skor
total_skor <- rowSums(item)

# Korelasi item dengan total skor
validitas <- data.frame(
  Item = names(item),
  r_hitung = sapply(item, function(x) cor(x, total_skor)),
  p_value = sapply(item, function(x)
    cor.test(x, total_skor)$p.value)
)

# Menampilkan hasil validitas
print(validitas)

# =========================
# UJI RELIABILITAS
# =========================
reliabilitas <- psych::alpha(item)

# Menampilkan hasil reliabilitas
reliabilitas

# Nilai Cronbach Alpha
reliabilitas$total$raw_alpha

# =========================
# ANALISIS DESKRIPTIF
# =========================

# Statistik deskriptif sederhana
summary(item)

# Statistik deskriptif lengkap
describe(item)

# =========================
# FREKUENSI DAN PERSENTASE
# SEMUA PERTANYAAN
# =========================

for(i in names(item)){
  
  cat("\n====================\n")
  cat("Frekuensi", i, "\n")
  cat("====================\n")
  
  print(table(item[[i]]))
  
  cat("\nPersentase", i, "\n")
  
  print(round(prop.table(table(item[[i]])) * 100, 2))
  
}

# =========================
# VISUALISASI DATA
# =========================

# Histogram distribusi responden
hist(
  total_skor,
  
  main = "Distribusi Total Skor Responden",
  
  xlab = "Total Skor",
  ylab = "Frekuensi Responden",
  
  col = "green",
  border = "black"
)
