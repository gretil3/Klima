# Desain Klima

Sumber kebenaran desain adalah **Figma**. Folder ini hanya berisi gambar acuan untuk membandingkan hasil app dengan desain.

- Figma: https://www.figma.com/design/LzPq3LvBrqzZWlxXMsCNAS/Klima
- File key: `LzPq3LvBrqzZWlxXMsCNAS`
- Ukuran frame layar: **390 x 844**
- Sumber kebenaran produk: proposal PDF di root repo (tanpa gamifikasi: tidak ada poin, level, atau peringkat).

## Peta halaman dan node Figma

| Halaman | Isi | Node |
|---|---|---|
| Screens `0:1` | 13 layar + varian | 29:2 Onboarding, 31:32 Inti, 33:87 Event, 45:151 Dial terbuka, 50:217 State komponen, 56:517 State "sudah gabung" |
| Components `4:2` | Pustaka komponen | 36:151 Tombol, 36:251 Tag, 36:298 Tanggal/emblem/orang, 36:389 Navigasi (header, dial), 38:208 Kartu, 39:241 Kontrol onboarding, 39:336 Check-in dan share |
| Assets `4:3` | Panduan gaya | 17:3 berang, 26:2 kepik, 26:3 penyu, 26:4 bambu, 26:5 mangrove, 26:6 lebah, 26:7 anggrek, 26:8 hero, 41:151 Warna 60/30/10, 41:228 Studi warna spirit, 42:151 Poligon x vektor, 42:282 Tipografi Nunito, 42:307 Layout (spasi, radius, bayangan), 42:353 Ikon |

## Token ringkas
- Font: **Nunito**. Skala: Display 48/900, Title 28/900, Header 24/900, Section 17/900, Body 15/700, Meta 13/800, Caption 12/900.
- Ikon: **Phosphor Bold**.
- Warna mengikuti rasio 60 (Main) / 30 (Charm) / 10 (Spirit). Nilai pastinya diambil dari Figma saat membuat file token di `app/lib/core/theme/`.

## Gambar acuan (`reference/`)

| File | Isi |
|---|---|
| `screens/00-all-screens.png` | Seluruh halaman Screens (8630 x 5558) |
| `screens/01-onboarding.png` | Selamat datang, Pilih peran, Pilih spirit |
| `screens/02-inti.png` | Beranda, Agenda, Circle, Profil, Kartu bulanan |
| `screens/03-event.png` | Event, 2 detail, Check-in, Kartu check-in |
| `screens/04-dial-open-states.png` | Navbar bulat terbuka di tiap tab |
| `screens/05-joined-states.png` | Detail event setelah bergabung |
| `assets/00-assets-page-overview.png` | Halaman Assets: mascot, palet, tipografi, layout, ikon |

Gambar di folder ini **tidak masuk ke aplikasi** (tidak didaftarkan di `pubspec.yaml`). Aset yang dipakai app ada di `app/assets/`.

## Yang belum ada di Figma
Layar login dan daftar, pengaturan, pemilih area, layar penyelenggara dan pemindai QR, serta state kosong, memuat, dan galat. Ini perlu keputusan sebelum dibangun.
