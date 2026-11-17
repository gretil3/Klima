# Aset app Klima

File ini tidak ikut dibundel ke app (hanya folder yang terdaftar di `pubspec.yaml`).

## Asal dan hak cipta

| Folder | Isi | Pembuat | Lisensi |
|---|---|---|---|
| `mascots/` | 7 mascot spirit (low-poly) | Tim Klima B4-1: Kevin dan ketua tim, dibantu alat AI | Milik tim Klima |
| `illustrations/` | `hero.png`, ilustrasi layar Selamat datang | Tim Klima B4-1: Kevin dan ketua tim, dibantu alat AI | Milik tim Klima |
| `fonts/` | Nunito 700/800/900 | The Nunito Project Authors (Google Fonts v32) | SIL OFL 1.1, lihat `fonts/OFL.txt` |

Sumber gambar: Figma `LzPq3LvBrqzZWlxXMsCNAS`, halaman Assets (4:3). Diambil sebagai
gambar asli yang diunggah ke Figma (bukan screenshot), jadi latar mascot tetap transparan.

## Ukuran

Ukuran tampil mascot terbesar di Figma adalah 160 x 160 (kartu Profil 32:101).

| File | Piksel | Untuk layar |
|---|---|---|
| `mascots/<id>.png` | 160 | 1x |
| `mascots/2.0x/<id>.png` | 320 | 2x |
| `mascots/3.0x/<id>.png` | 480 | 3x |

- `3.0x/` = gambar asli dari Figma, tidak diubah (kecuali berang, lihat di bawah).
- `2.0x/` dan 1x diperkecil dari gambar asli (rata-rata area, alfa premultiplied).
- **Berang**: di Figma hanya 210 x 210 (PNG palet). Diperbesar ke 480 dan 320 dengan
  interpolasi bikubik, sedangkan 160 diperkecil. Hasilnya sedikit lebih lembut daripada
  mascot lain. Ganti dengan ekspor asli 480 x 480 (latar transparan) bila ada.
- **Hero**: 1000 x 1000, buram, disimpan apa adanya. Di layar 390 x 466 artinya sekitar
  2,1x; untuk 3x penuh dibutuhkan sumber sekitar 1400 px.

Nama file = `SpiritPalette.id` (kepik, lebah, penyu, berang, mangrove, anggrek, bambu).
