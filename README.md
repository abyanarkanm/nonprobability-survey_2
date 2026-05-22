# nonprobability-survey_2
### Nama: [Nama Lengkap]
### NIM: [Nomor Induk Mahasiswa]
### Program Studi: [Program Studi]

---

# Analisis Survei Penggunaan Spotify & Music Streaming terhadap Produktivitas Belajar Mahasiswa

Proyek ini merupakan analisis statistik kuantitatif berbasis survei yang bertujuan untuk mengukur pengaruh penggunaan platform *music streaming* (Spotify) terhadap produktivitas belajar mahasiswa. Analisis dilakukan menggunakan bahasa pemrograman **R** dengan pendekatan uji validitas, reliabilitas, dan statistik deskriptif. Data dikumpulkan melalui kuesioner daring menggunakan Google Form dengan skala pengukuran Likert.

---

## 📋 Daftar Isi

- [Pendahuluan](#pendahuluan)
- [Metode Penelitian](#metode-penelitian)
- [Hasil dan Pembahasan](#hasil-dan-pembahasan)
- [Analisis Komparatif](#analisis-komparatif)
- [Kesimpulan](#kesimpulan)

---

## Pendahuluan

### Latar Belakang

Di era digital saat ini, platform *music streaming* seperti Spotify telah menjadi bagian tak terpisahkan dari kehidupan sehari-hari mahasiswa. Ketersediaan musik yang mudah diakses kapan saja dan di mana saja memunculkan pertanyaan penting: apakah kebiasaan mendengarkan musik saat belajar berdampak positif atau justru kontraproduktif terhadap performa akademik?

Secara ideal, mahasiswa diharapkan mampu mengelola waktu belajar secara efektif dengan fokus penuh. Namun, realita di lapangan menunjukkan bahwa banyak mahasiswa yang secara aktif menggunakan platform *music streaming* secara bersamaan dengan aktivitas akademik mereka — baik saat mengerjakan tugas, membaca, maupun belajar mandiri. Kondisi ini menciptakan kesenjangan yang perlu dikaji lebih lanjut secara empiris.

Penelitian ini hadir untuk mengisi kekosongan data tersebut dengan menganalisis persepsi mahasiswa secara langsung melalui instrumen kuesioner yang terstandarisasi dan telah diuji kualitasnya.

### Rumusan Masalah

1. Apakah instrumen kuesioner yang digunakan valid untuk mengukur persepsi mahasiswa terhadap pengaruh *music streaming* pada produktivitas belajar?
2. Apakah instrumen kuesioner yang digunakan reliabel dan konsisten secara internal?
3. Bagaimana distribusi dan kecenderungan jawaban responden terhadap setiap item pertanyaan survei?

### Tujuan Penelitian

1. Menguji validitas setiap item instrumen kuesioner menggunakan korelasi item-total skor.
2. Menguji reliabilitas instrumen menggunakan koefisien Cronbach's Alpha.
3. Mendeskripsikan distribusi frekuensi dan persentase jawaban responden pada setiap item pertanyaan.

---

## Metode Penelitian

### Jenis & Teknik Penelitian

Penelitian ini menggunakan **pendekatan kuantitatif** dengan metode **survei deskriptif**. Data primer dikumpulkan melalui kuesioner daring berbasis Google Form, kemudian diolah dan dianalisis menggunakan perangkat lunak statistik R.

### Populasi & Sampel

| Komponen | Keterangan |
|---|---|
| **Populasi Target** | Mahasiswa pengguna Spotify / platform *music streaming* |
| **Jumlah Populasi (N)** | 157 orang |
| **Tingkat Kesalahan (e)** | 10% (0,10) |
| **Jumlah Sampel Minimum** | 62 responden |
| **Teknik Sampling** | Slovin Sampling |

### Formulasi Ukuran Sampel (Rumus Slovin)

$$n = \frac{N}{1 + N \cdot e^2}$$

**Keterangan:**
- $n$ = Ukuran sampel minimum
- $N$ = Ukuran populasi = 157
- $e$ = Tingkat kesalahan yang ditoleransi = 0,10

**Perhitungan:**

$$n = \frac{157}{1 + 157 \times (0{,}10)^2} = \frac{157}{1 + 1{,}57} = \frac{157}{2{,}57} \approx 61{,}09 \rightarrow \lceil 61{,}09 \rceil = \mathbf{62 \text{ responden}}$$

### Skala Pengukuran Instrumen

Kuesioner menggunakan **Skala Likert 5 Poin** dengan bobot sebagai berikut:

| Skor | Kategori Jawaban |
|:---:|---|
| 5 | Sangat Setuju (SS) |
| 4 | Setuju (S) |
| 3 | Netral (N) |
| 2 | Tidak Setuju (TS) |
| 1 | Sangat Tidak Setuju (STS) |

### Dokumentasi Script R

#### 1. Load Library

```r
library(readxl)   # Membaca file Excel
library(psych)    # Uji reliabilitas (Cronbach's Alpha)
library(tidyverse) # Manipulasi dan transformasi data
```

#### 2. Import Data

```r
data <- read_excel("path/to/file.xlsx")

# Melihat struktur data
View(data)
str(data)
```

#### 3. Transformasi Tipe Variabel

```r
# Mengubah semua variabel menjadi numerik
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

#### 5. Uji Validitas

```r
item <- data[, 1:10]  # Memilih 10 item pertanyaan
total_skor <- rowSums(item)  # Menghitung total skor

validitas <- data.frame(
  Item    = names(item),
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

#### 8. Visualisasi Data

```r
hist(
  total_skor,
  main   = "Distribusi Total Skor Responden",
  xlab   = "Total Skor",
  ylab   = "Frekuensi Responden",
  col    = "lightblue",
  border = "black"
)
```

---

## Hasil dan Pembahasan

### 4.1 Uji Validitas

> ⚠️ *Isi tabel berikut dengan hasil output dari script R Anda.*

| No. | Item | $r_{hitung}$ | $p\text{-value}$ | Status |
|:---:|---|:---:|:---:|:---:|
| 1 | Item 1 | — | — | Valid / Tidak Valid |
| 2 | Item 2 | — | — | Valid / Tidak Valid |
| 3 | Item 3 | — | — | Valid / Tidak Valid |
| 4 | Item 4 | — | — | Valid / Tidak Valid |
| 5 | Item 5 | — | — | Valid / Tidak Valid |
| 6 | Item 6 | — | — | Valid / Tidak Valid |
| 7 | Item 7 | — | — | Valid / Tidak Valid |
| 8 | Item 8 | — | — | Valid / Tidak Valid |
| 9 | Item 9 | — | — | Valid / Tidak Valid |
| 10 | Item 10 | — | — | Valid / Tidak Valid |

**Interpretasi:** Berdasarkan hasil uji validitas, item dengan nilai korelasi tertinggi adalah **[Item X]** ($r_{hitung}$ = ...), yang menunjukkan konsistensi pengukuran paling kuat terhadap konstruk total. Sebaliknya, item dengan korelasi terendah adalah **[Item Y]** ($r_{hitung}$ = ...). Seluruh item dinyatakan **valid** apabila nilai $p\text{-value} < 0{,}05$.

---

### 4.2 Uji Reliabilitas

> ⚠️ *Isi tabel berikut dengan hasil output dari script R Anda.*

| Koefisien | Nilai | Jumlah Item | Status |
|---|:---:|:---:|---|
| Cronbach's Alpha | — | 10 | Reliabel / Tidak Reliabel |

**Interpretasi:** Instrumen dinyatakan **reliabel** apabila nilai Cronbach's Alpha ≥ 0,70. Nilai yang diperoleh sebesar **[...]** menunjukkan bahwa instrumen memiliki konsistensi internal yang [baik/cukup/kurang] dan layak digunakan untuk pengukuran lebih lanjut.

---

### 4.3 Analisis Deskriptif

> ⚠️ *Isi tabel berikut dengan hasil output loop frekuensi & persentase dari script R Anda.*

#### Tabel Frekuensi

| Item | STS (1) | TS (2) | N (3) | S (4) | SS (5) | Total |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| Item 1 | — | — | — | — | — | — |
| Item 2 | — | — | — | — | — | — |
| Item 3 | — | — | — | — | — | — |
| Item 4 | — | — | — | — | — | — |
| Item 5 | — | — | — | — | — | — |
| Item 6 | — | — | — | — | — | — |
| Item 7 | — | — | — | — | — | — |
| Item 8 | — | — | — | — | — | — |
| Item 9 | — | — | — | — | — | — |
| Item 10 | — | — | — | — | — | — |

#### Tabel Persentase (%)

| Item | STS (1) | TS (2) | N (3) | S (4) | SS (5) | Total |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| Item 1 | —% | —% | —% | —% | —% | 100% |
| Item 2 | —% | —% | —% | —% | —% | 100% |
| Item 3 | —% | —% | —% | —% | —% | 100% |
| Item 4 | —% | —% | —% | —% | —% | 100% |
| Item 5 | —% | —% | —% | —% | —% | 100% |
| Item 6 | —% | —% | —% | —% | —% | 100% |
| Item 7 | —% | —% | —% | —% | —% | 100% |
| Item 8 | —% | —% | —% | —% | —% | 100% |
| Item 9 | —% | —% | —% | —% | —% | 100% |
| Item 10 | —% | —% | —% | —% | —% | 100% |

**Interpretasi:** Secara umum, distribusi jawaban responden menunjukkan kecenderungan ke arah **[Setuju/Netral/...]**, yang mengindikasikan bahwa sebagian besar mahasiswa [tuliskan tren utama berdasarkan data]. Item yang mendapat respons paling dominan positif adalah **[Item X]**, sementara item dengan variasi jawaban terluas adalah **[Item Y]**, yang mengisyaratkan perbedaan persepsi yang signifikan di kalangan responden.

---

## Analisis Komparatif

Bagian ini membandingkan hasil analisis antara kondisi **Sampel Kecil** (menggunakan tingkat kesalahan *e* = 10%, n ≈ 62) dan **Sampel Besar** (misalnya *e* = 5%, n ≈ 113) untuk membuktikan efek penambahan responden terhadap kualitas dan stabilitas instrumen.

### 5.1 Komparasi Ukuran Sampel (Rumus Slovin)

| Parameter | Sampel Kecil | Sampel Besar |
|---|:---:|:---:|
| Tingkat Kesalahan (e) | 10% | 5% |
| Ukuran Sampel (n) | ≈ 62 | ≈ 113 |
| Tingkat Ketelitian | 90% | 95% |

### 5.2 Komparasi Kualitas Instrumen

> ⚠️ *Isi dengan nilai aktual dari dua kondisi sampel.*

| Metrik | Sampel Kecil (n≈62) | Sampel Besar (n≈113) | Perubahan |
|---|:---:|:---:|:---:|
| $r_{hitung}$ rata-rata | — | — | ↑ / ↓ / → |
| Cronbach's Alpha | — | — | ↑ / ↓ / → |
| Jumlah Item Valid | — / 10 | — / 10 | ↑ / ↓ / → |

### 5.3 Komparasi Distribusi Jawaban

Pada kondisi sampel kecil, distribusi jawaban responden cenderung [lebih/kurang] bervariasi karena keterbatasan jumlah observasi yang merepresentasikan populasi. Penambahan ukuran sampel menjadi sampel besar diharapkan menghasilkan distribusi yang lebih [stabil/representatif], di mana simpangan baku antar item cenderung [mengecil/membesar], dan proporsi jawaban pada kategori ekstrem (STS & SS) menjadi lebih [proporsional/terwakili].

---

## Kesimpulan

### Rangkuman Temuan

1. **Validitas:** Instrumen kuesioner yang terdiri dari 10 item pertanyaan menunjukkan hasil [seluruhnya/sebagian besar] valid, yang ditunjukkan oleh nilai $r_{hitung}$ yang signifikan ($p < 0{,}05$) pada masing-masing item.
2. **Reliabilitas:** Instrumen terbukti reliabel dengan nilai Cronbach's Alpha sebesar **[...]**, melampaui ambang batas minimum 0,70 yang disyaratkan untuk kelayakan instrumen penelitian.
3. **Deskriptif:** Distribusi jawaban responden secara umum condong ke arah [Setuju/Positif/...], mengindikasikan bahwa mahasiswa [simpulkan tren utama dari data].

### Evaluasi Metodologis

Secara keseluruhan, instrumen kuesioner yang digunakan dalam penelitian ini telah memenuhi standar kualitas psikometri yang disyaratkan, baik dari sisi validitas konstruk maupun konsistensi internal. Instrumen ini dinilai **layak** untuk digunakan dalam pengambilan data pada penelitian lanjutan dengan populasi dan konteks yang serupa.

### Rekomendasi

1. **Evaluasi Item Berperforma Rendah:** Item dengan nilai $r_{hitung}$ paling rendah perlu dikaji ulang dari sisi redaksi dan kejelasan pertanyaan agar lebih mudah dipahami oleh responden.
2. **Perluasan Sampel:** Guna meningkatkan representativitas dan stabilitas instrumen, disarankan untuk menggunakan tingkat kesalahan yang lebih ketat (misalnya *e* = 5%) pada penelitian berikutnya.
3. **Tindak Lanjut Data Deskriptif:** Temuan distribusi jawaban yang cenderung [positif/netral] perlu ditindaklanjuti dengan studi kualitatif untuk menggali lebih dalam faktor-faktor yang memengaruhi persepsi mahasiswa terhadap penggunaan *music streaming* dalam konteks akademik.

---

## 🛠️ Teknologi yang Digunakan

| Tools | Fungsi |
|---|---|
| **R** | Bahasa pemrograman analisis statistik |
| `readxl` | Import data dari file Excel (.xlsx) |
| `psych` | Uji reliabilitas (Cronbach's Alpha) |
| `tidyverse` | Transformasi dan manipulasi data |
| **Google Form** | Platform pengumpulan data survei |
| **Microsoft Excel** | Format penyimpanan data mentah |

---

## 📁 Struktur Repository

```
📦 repository-name/
├── 📄 README.md
├── 📄 analisis_tugas2.R        # Script analisis utama
└── 📊 data/
    └── responses.xlsx          # Data mentah hasil survei (opsional)
```

---

> 📌 **Catatan:** Tabel yang bertanda ⚠️ perlu diisi secara manual dengan hasil output aktual dari eksekusi script R di lingkungan lokal Anda.
