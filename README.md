### Nama: Abyan Arkan Maulana
### NIM: G1F02410013
### Program Studi: Statistika

---

# Analisis Survei Penggunaan Spotify & Music Streaming terhadap Produktivitas Belajar Mahasiswa

Proyek ini merupakan analisis statistik kuantitatif berbasis survei yang bertujuan untuk mengukur persepsi mahasiswa terhadap pengaruh penggunaan platform *music streaming* (Spotify, YouTube Music, dll.) terhadap produktivitas belajar mereka. Analisis dilakukan menggunakan bahasa pemrograman **R** dengan pendekatan uji validitas, reliabilitas, dan statistik deskriptif. Data dikumpulkan melalui kuesioner daring berbasis Google Form yang disebarkan kepada **28 responden mahasiswa Program Studi Statistika**, dengan skala pengukuran Likert 5 poin.

---

## Daftar Isi

- [Pendahuluan](#pendahuluan)
- [Metode Penelitian](#metode-penelitian)
- [Hasil dan Pembahasan](#hasil-dan-pembahasan)
- [Analisis Perbandingan](#analisis-perbadingan)
- [Kesimpulan](#kesimpulan)
  
## Pendahuluan

### Latar Belakang

Di era digital saat ini, platform *music streaming* seperti Spotify dan YouTube Music telah menjadi bagian tak terpisahkan dari kehidupan sehari-hari mahasiswa. Ketersediaan musik yang mudah diakses kapan saja dan di mana saja memunculkan pertanyaan penting: apakah kebiasaan mendengarkan musik saat belajar berdampak positif atau justru kontraproduktif terhadap performa akademik?

Secara ideal, mahasiswa diharapkan mampu mengelola waktu belajar secara efektif dengan fokus penuh. Namun, realita di lapangan menunjukkan bahwa banyak mahasiswa secara aktif menggunakan platform *music streaming* secara bersamaan dengan aktivitas akademik mereka — baik saat mengerjakan tugas, membaca, maupun belajar mandiri. Kondisi ini menciptakan kesenjangan yang perlu dikaji lebih lanjut secara empiris.

Penelitian ini hadir untuk mengisi kekosongan data tersebut dengan menganalisis persepsi mahasiswa secara langsung melalui instrumen kuesioner yang terstandarisasi dan telah diuji kualitasnya melalui serangkaian uji psikometri.

### Rumusan Masalah

1. Apakah instrumen kuesioner yang digunakan valid untuk mengukur persepsi mahasiswa terhadap pengaruh *music streaming* pada produktivitas belajar?
2. Apakah instrumen kuesioner yang digunakan reliabel dan konsisten secara internal?
3. Bagaimana distribusi dan kecenderungan jawaban responden terhadap setiap item pertanyaan survei?

### Tujuan Penelitian

1. Menguji validitas setiap item instrumen kuesioner menggunakan korelasi item-total skor (Pearson).
2. Menguji reliabilitas instrumen menggunakan koefisien Cronbach's Alpha.
3. Mendeskripsikan distribusi frekuensi dan persentase jawaban responden pada setiap item pertanyaan.

---

## Metode Penelitian

### Jenis & Teknik Penelitian

Penelitian ini menggunakan **pendekatan kuantitatif** dengan metode **survei deskriptif**. Data primer dikumpulkan melalui kuesioner daring berbasis Google Form, kemudian diolah dan dianalisis menggunakan perangkat lunak statistik R.

### Populasi & Sampel

| Komponen | Keterangan |
|---|---|
| **Populasi Target** | Mahasiswa pengguna platform *music streaming* |
| **Jumlah Populasi (N)** | 157 orang |
| **Tingkat Kesalahan (e)** | 10% (0,10) |
| **Jumlah Sampel Minimum** | 62 responden |
| **Jumlah Responden Aktual** | 28 responden |
| **Komposisi Gender** | 21 Perempuan (75%) · 7 Laki-laki (25%) |
| **Program Studi** | Statistika |
| **Teknik Sampling** | Slovin Sampling |

### Formulasi Ukuran Sampel (Rumus Slovin)

$$n = \frac{N}{1 + N \cdot e^2}$$

**Keterangan:**
- $n$ = Ukuran sampel minimum
- $N$ = Ukuran populasi = 157
- $e$ = Tingkat kesalahan yang ditoleransi = 0,10

**Perhitungan:**

$$n = \frac{157}{1 + 157 \times (0{,}10)^2} = \frac{157}{1 + 1{,}57} = \frac{157}{2{,}57} \approx 61{,}09 \rightarrow \lceil 61{,}09 \rceil = \mathbf{62 \text{ responden}}$$

> **Catatan:** Jumlah responden yang berhasil dikumpulkan sebanyak 28 orang, sehingga analisis ini bersifat eksploratori dengan ukuran sampel kecil (*pilot study*). Penambahan sampel hingga ≥62 responden direkomendasikan untuk penelitian lanjutan.

### Skala Pengukuran Instrumen

Kuesioner menggunakan **Skala Likert 5 Poin** dengan bobot sebagai berikut:

| Skor | Kategori Jawaban |
|:---:|---|
| 5 | Sangat Setuju (SS) |
| 4 | Setuju (S) |
| 3 | Netral (N) |
| 2 | Tidak Setuju (TS) |
| 1 | Sangat Tidak Setuju (STS) |

### Daftar Item Pertanyaan Kuesioner

| No. | Pernyataan |
|:---:|---|
| Item 1 | Saya menggunakan platform music streaming (Spotify, YouTube Music, dll.) saat belajar. |
| Item 2 | Mendengarkan musik membantu saya lebih fokus saat mengerjakan tugas. |
| Item 3 | Saya merasa lebih semangat belajar ketika ditemani musik. |
| Item 4 | Musik membantu saya mengurangi rasa bosan saat belajar. |
| Item 5 | Saya lebih cepat menyelesaikan tugas ketika mendengarkan musik. |
| Item 6 | Musik yang saya dengarkan tidak mengganggu konsentrasi saya. |
| Item 7 | Saya merasa produktivitas belajar saya meningkat dengan adanya musik. |
| Item 8 | Saya lebih nyaman belajar di tempat yang ada musik dibanding yang sunyi. |
| Item 9 | Saya secara aktif memilih playlist tertentu untuk menemani waktu belajar. |
| Item 10 | Secara keseluruhan, music streaming memberikan dampak positif terhadap produktivitas belajar saya. |

### Dokumentasi Script R

#### 1. Load Library

```r
library(readxl)    # Membaca file Excel
library(psych)     # Uji reliabilitas (Cronbach's Alpha)
library(tidyverse) # Manipulasi dan transformasi data
```

#### 2. Import & Eksplorasi Data

```r
data <- read_excel("C:/Users/MyBook14E/OneDrive - UGM 365/Documents/ABYAN/Kuliah/Survei Penggunaan Spotify_Music Streaming terhadap Produktivitas Belajar Mahasiswa   (Responses) - Form Responses 1 - Copy.xlsx")

View(data)
str(data)
```

#### 3. Transformasi Tipe Variabel

```r
data <- data %>%
  mutate(across(everything(), as.numeric))
```

#### 4. Kalkulasi Ukuran Sampel (Rumus Slovin)

```r
N <- 157   # Jumlah populasi
e <- 0.10  # Tingkat kesalahan

n <- N / (1 + N * e^2)
ceiling(n) # Hasil: 62 responden
```

#### 5. Seleksi Item & Uji Validitas

```r
item <- data[, 1:10]  # Memilih 10 item pertanyaan
total_skor <- rowSums(item)

validitas <- data.frame(
  Item     = names(item),
  r_hitung = sapply(item, function(x) cor(x, total_skor)),
  p_value  = sapply(item, function(x) cor.test(x, total_skor)$p.value)
)

print(validitas)
```

#### 6. Uji Reliabilitas

```r
reliabilitas <- psych::alpha(item)
reliabilitas$total$raw_alpha  # Nilai Cronbach's Alpha
```

#### 7. Loop Frekuensi & Persentase

```r
for(i in names(item)){
  cat("\n====================\n")
  cat("Frekuensi", i, "\n")
  cat("====================\n")
  print(table(item[[i]]))
  cat("\nPersentase", i, "\n")
  print(round(prop.table(table(item[[i]])) * 100, 2))
}
```

#### 8. Visualisasi Histogram

```r
hist(
  total_skor,
  main   = "Distribusi Total Skor Responden",
  xlab   = "Total Skor",
  ylab   = "Frekuensi Responden",
  col    = "green",
  border = "black"
)
```

---

## Hasil dan Pembahasan

### 4.1 Uji Validitas

Uji validitas dilakukan dengan menghitung korelasi Pearson antara skor setiap item dengan total skor keseluruhan. Item dinyatakan **valid** apabila nilai $p\text{-value} < 0{,}05$.

| No. | Pernyataan | $r_{hitung}$ | $p\text{-value}$ | Status |
|:---:|---|:---:|:---:|:---:|
| 1 | Penggunaan platform *music streaming* saat belajar | 0,8570 | < 0,001 | ✅ Valid |
| 2 | Musik membantu lebih fokus saat mengerjakan tugas | 0,7283 | < 0,001 | ✅ Valid |
| 3 | Lebih semangat belajar ketika ditemani musik | 0,8745 | < 0,001 | ✅ Valid |
| 4 | Musik mengurangi rasa bosan saat belajar | 0,6432 | < 0,001 | ✅ Valid |
| 5 | Lebih cepat menyelesaikan tugas saat mendengarkan musik | 0,7857 | < 0,001 | ✅ Valid |
| 6 | Musik tidak mengganggu konsentrasi | 0,2551 | 0,1901 | ❌ Tidak Valid |
| 7 | Produktivitas belajar meningkat dengan adanya musik | 0,9313 | < 0,001 | ✅ Valid |
| 8 | Lebih nyaman belajar di tempat ada musik vs sunyi | 0,7915 | < 0,001 | ✅ Valid |
| 9 | Aktif memilih playlist untuk menemani belajar | 0,7867 | < 0,001 | ✅ Valid |
| 10 | *Music streaming* berdampak positif secara keseluruhan | 0,8728 | < 0,001 | ✅ Valid |

**Interpretasi:** Dari 10 item yang diuji, **9 item dinyatakan valid** dan 1 item tidak valid. Item dengan korelasi tertinggi adalah **Item 7** ($r_{hitung}$ = 0,9313) mengenai peningkatan produktivitas belajar secara umum, yang menunjukkan konsistensi pengukuran paling kuat terhadap konstruk total. Item dengan korelasi terendah adalah **Item 6** ($r_{hitung}$ = 0,2551, $p$ = 0,190) mengenai anggapan musik tidak mengganggu konsentrasi — item ini **tidak valid** karena $p\text{-value} > 0{,}05$, mengindikasikan persepsi responden pada aspek gangguan konsentrasi tidak konsisten dengan arah konstruk secara keseluruhan. Item 6 perlu direvisi atau dipertimbangkan untuk dihapus dari instrumen.

---

### 4.2 Uji Reliabilitas

| Koefisien | Nilai | Jumlah Item | Status |
|---|:---:|:---:|:---:|
| Cronbach's Alpha | **0,9202** | 10 | ✅ Sangat Reliabel |

**Interpretasi:** Nilai Cronbach's Alpha sebesar **0,9202** melampaui ambang batas minimum reliabilitas yang disyaratkan (α ≥ 0,70). Menurut kategori George & Mallery (2003), nilai ini masuk dalam kategori **"Excellent"** (α > 0,90), yang berarti instrumen memiliki tingkat konsistensi internal yang sangat tinggi. Dengan demikian, instrumen kuesioner ini **layak dan andal** digunakan untuk mengukur persepsi mahasiswa terhadap pengaruh *music streaming* pada produktivitas belajar.

---

### 4.3 Analisis Deskriptif

#### Tabel Frekuensi

| No. | Pernyataan | STS (1) | TS (2) | N (3) | S (4) | SS (5) | Total |
|:---:|---|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | Penggunaan *music streaming* saat belajar | 2 | 0 | 5 | 11 | 10 | 28 |
| 2 | Musik membantu lebih fokus saat tugas | 1 | 2 | 11 | 8 | 6 | 28 |
| 3 | Lebih semangat belajar dengan musik | 2 | 0 | 4 | 10 | 12 | 28 |
| 4 | Musik mengurangi rasa bosan | 1 | 0 | 2 | 11 | 14 | 28 |
| 5 | Lebih cepat selesaikan tugas dengan musik | 1 | 1 | 14 | 6 | 6 | 28 |
| 6 | Musik tidak mengganggu konsentrasi | 0 | 1 | 12 | 8 | 7 | 28 |
| 7 | Produktivitas meningkat dengan musik | 2 | 2 | 8 | 9 | 7 | 28 |
| 8 | Lebih nyaman belajar dengan musik vs sunyi | 2 | 2 | 11 | 7 | 6 | 28 |
| 9 | Aktif memilih playlist untuk belajar | 1 | 1 | 6 | 11 | 9 | 28 |
| 10 | Dampak positif *music streaming* secara keseluruhan | 2 | 0 | 8 | 10 | 8 | 28 |

#### Tabel Persentase (%)

| No. | Pernyataan | STS (1) | TS (2) | N (3) | S (4) | SS (5) | Total |
|:---:|---|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | Penggunaan *music streaming* saat belajar | 7,14% | 0,00% | 17,86% | 39,29% | 35,71% | 100% |
| 2 | Musik membantu lebih fokus saat tugas | 3,57% | 7,14% | 39,29% | 28,57% | 21,43% | 100% |
| 3 | Lebih semangat belajar dengan musik | 7,14% | 0,00% | 14,29% | 35,71% | 42,86% | 100% |
| 4 | Musik mengurangi rasa bosan | 3,57% | 0,00% | 7,14% | 39,29% | 50,00% | 100% |
| 5 | Lebih cepat selesaikan tugas dengan musik | 3,57% | 3,57% | 50,00% | 21,43% | 21,43% | 100% |
| 6 | Musik tidak mengganggu konsentrasi | 0,00% | 3,57% | 42,86% | 28,57% | 25,00% | 100% |
| 7 | Produktivitas meningkat dengan musik | 7,14% | 7,14% | 28,57% | 32,14% | 25,00% | 100% |
| 8 | Lebih nyaman belajar dengan musik vs sunyi | 7,14% | 7,14% | 39,29% | 25,00% | 21,43% | 100% |
| 9 | Aktif memilih playlist untuk belajar | 3,57% | 3,57% | 21,43% | 39,29% | 32,14% | 100% |
| 10 | Dampak positif *music streaming* secara keseluruhan | 7,14% | 0,00% | 28,57% | 35,71% | 28,57% | 100% |

#### Statistik Deskriptif per Item

| No. | Pernyataan | Mean | Std. Dev. |
|:---:|---|:---:|:---:|
| 1 | Penggunaan *music streaming* saat belajar | 3,96 | 1,10 |
| 2 | Musik membantu lebih fokus saat tugas | 3,57 | 1,03 |
| 3 | Lebih semangat belajar dengan musik | 4,07 | 1,12 |
| **4** | **Musik mengurangi rasa bosan** | **4,32** | **0,90** |
| 5 | Lebih cepat selesaikan tugas dengan musik | 3,54 | 1,00 |
| 6 | Musik tidak mengganggu konsentrasi | 3,75 | 0,89 |
| 7 | Produktivitas meningkat dengan musik | 3,61 | 1,17 |
| 8 | Lebih nyaman belajar dengan musik vs sunyi | 3,46 | 1,14 |
| 9 | Aktif memilih playlist untuk belajar | 3,93 | 1,02 |
| 10 | Dampak positif *music streaming* secara keseluruhan | 3,79 | 1,10 |
| — | **Total Skor** | **38,00** | **8,02** |

**Interpretasi:** Secara umum, distribusi jawaban responden menunjukkan kecenderungan ke arah **Setuju (S)** hingga **Sangat Setuju (SS)** pada sebagian besar item. Item dengan rata-rata tertinggi adalah **Item 4** (*Mean* = 4,32) mengenai peran musik dalam mengurangi rasa bosan, di mana 50% responden menjawab Sangat Setuju — mengindikasikan konsensus yang kuat bahwa *music streaming* efektif sebagai pengelola emosi belajar. Sebaliknya, **Item 8** (*Mean* = 3,46) mengenai preferensi belajar di tempat bermusik vs sunyi memiliki rata-rata terendah dengan sebaran jawaban yang paling variatif, mencerminkan adanya perbedaan preferensi lingkungan belajar yang signifikan di kalangan responden. Item 5 (*Mean* = 3,54) tentang kecepatan penyelesaian tugas juga menunjukkan distribusi yang paling merata (50% Netral), menandakan keyakinan responden terhadap dampak musik pada efisiensi kerja masih terbagi.

---

## Analisis Perbadingan

Bagian ini membandingkan kondisi **Sampel Kecil** (data aktual, n = 28, e ≈ 17%) dengan simulasi **Sampel Besar** sesuai standar Slovin (n ≥ 62, e = 10%) untuk mengilustrasikan efek penambahan sampel terhadap kualitas dan stabilitas instrumen.

### 5.1 Perbandingan Ukuran Sampel (Rumus Slovin)

| Parameter | Sampel Kecil (Aktual) | Sampel Besar (Target Slovin) |
|---|:---:|:---:|
| Jumlah Responden (n) | 28 | ≥ 62 |
| Tingkat Kesalahan (e) | ≈ 17% | 10% |
| Tingkat Ketelitian | ≈ 83% | 90% |
| Representativitas | Rendah–Sedang | Memadai |

### 5.2 Perbandingan Kualitas Instrumen

| Metrik | Sampel Kecil (n=28) | Sampel Besar (n≥62) | Proyeksi |
|---|:---:|:---:|---|
| Item Valid | 9 / 10 | Estimasi 9–10 / 10 | Stabilitas meningkat |
| $r_{hitung}$ rata-rata (9 item valid) | 0,7896 | Cenderung lebih stabil | Fluktuasi mengecil |
| Cronbach's Alpha | 0,9202 | Proyeksi ≥ 0,90 | Reliabilitas terjaga |
| Item 6 ($r_{hitung}$) | 0,2551 (✗) | Berpotensi meningkat | Perlu revisi redaksi |

### 5.3 Perbandingan Distribusi Jawaban

Pada kondisi sampel kecil (n = 28), distribusi jawaban tampak cukup bervariasi, terutama pada item-item yang berkaitan dengan efisiensi belajar (Item 5) dan preferensi lingkungan (Item 8), di mana proporsi jawaban Netral sangat dominan (masing-masing 50% dan 39%). Hal ini wajar mengingat keterbatasan jumlah observasi yang belum sepenuhnya merepresentasikan keberagaman populasi.

Pada simulasi sampel besar (n ≥ 62), distribusi jawaban diproyeksikan akan menjadi lebih stabil dan proporsional. Proporsi jawaban pada kategori ekstrem (STS & SS) cenderung akan lebih terdistribusi merata, simpangan baku antar item akan mengecil, dan nilai korelasi item-total — khususnya Item 6 — berpotensi mengalami penyesuaian ke arah yang lebih representatif terhadap konstruk populasi yang sebenarnya.

---

## Kesimpulan

Berdasarkan hasil analisis, instrumen kuesioner ini secara keseluruhan telah memenuhi standar kualitas psikometri yang disyaratkan karena memiliki konsistensi internal yang sangat tinggi dengan nilai Cronbach's Alpha sebesar 0,9202 (kategori Excellent) dan mayoritas itemnya dinyatakan valid (9 dari 10 item dengan $p < 0,05$), di mana respons responden secara umum condong ke arah positif (Setuju–Sangat Setuju) dengan total skor rata-rata 38,00 dari maksimum 50 terutama pada poin fungsi musik sebagai pengurang rasa bosan belajar. Kendati instrumen ini dinilai konsisten dan layak digunakan untuk skala yang lebih besar, penelitian ini masih bersifat eksploratori karena jumlah sampel aktual ($n = 28$) belum memenuhi batas minimum rumus Slovin ($n = 62$), sehingga pengumpulan data wajib dilanjutkan demi meningkatkan representativitas dan menekan margin of error. Selain itu, sebagai langkah tindak lanjut, diperlukan revisi redaksional pada Item 6 yang tidak valid karena formulasi kalimat negatifnya memicu ambiguitas bagi responden, serta disarankan adanya kajian kualitatif mendalam untuk mengeksplorasi peran musik sebagai pengatur suasana belajar (mood regulator) guna mengatasi kekhawatiran terkait potensi gangguan konsentrasi.

---

## Link Kuisioner
https://forms.gle/6pZKbfLmUCZvdz4SA
