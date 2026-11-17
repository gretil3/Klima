# Phase 1: design system dan rangka navigasi

Tujuan: tampilan Klima mulai terlihat di Chrome (390 x 844), dengan komponen yang cocok dengan Figma dan navigasi antar layar kosong yang berfungsi. Belum ada data asli dan belum ada fitur Firebase baru.

Cara tes: Chrome saja (belum ada kabel USB ke HP). Bandingkan dengan gambar di `design/reference/`.

Kerjakan **satu langkah per giliran**. Setiap langkah selesai hanya jika kriterianya terbukti, bukan diasumsikan.

| # | Langkah | Hasil di repo | Selesai bila |
|---|---|---|---|
| 0 | Rapikan repo | `design/`, `docs/`, `app/assets/` | Struktur ada, gambar acuan tersalin |
| 1 | Token dari Figma | `app/lib/core/theme/` (warna, tipografi, radius, spasi, bayangan) | Nilai cocok dengan halaman Assets Figma |
| 2 | Tema dan font | `ThemeData`, Nunito di `app/assets/fonts/` | Teks tampil dengan Nunito, tanpa unduhan saat jalan |
| 3 | Aset gambar | 7 mascot + hero di `app/assets/` | Semua gambar tampil, latar transparan |
| 4 | Tombol | Primary, Secondary, Share action, Icon, Pill, Filter chip, Round action, Text | Cocok dengan Figma, ukuran sentuh minimal 44 |
| 5 | Tag dan elemen kecil | Status, Category, Identity, hex emblem, date tile | Cocok dengan Figma |
| 6 | Header | Main, sub, onboarding | Cocok dengan Figma |
| 7 | Navbar bulat (dial) | Tertutup dan terbuka, animasi, label semantik | Membuka dan menutup mulus, bisa dipakai pembaca layar |
| 8 | Router dan layar placeholder | 13 layar kosong, navigasi berfungsi | Semua rute terbuka, dial muncul di tab utama |
| 9 | Galeri komponen | Rute `/gallery` | Semua komponen terlihat berdampingan dengan acuan |
| 10 | Pindahkan tes Firebase | Rute dev `/dev/firebase-check` | Empat centang masih hijau |
| 11 | Verifikasi dan pelajaran | `flutter analyze` bersih, tes widget dasar | Tidak ada error console di Chrome, ringkasan dan mini-pelajaran ditulis |

## Aturan
- Paket baru (mis. `go_router`, `phosphor_flutter`) diajukan dulu dengan alasannya.
- Kartu event, kartu QR, dan kartu bulanan dibangun bersama layarnya di Phase 2.
- Tidak ada gamifikasi.
- Commit dan push dilakukan oleh pemilik repo.

## Menjalankan di Chrome
Buka PowerShell baru, lalu:

    cd "D:\Projects - TGBTG\Klima\app"
    flutter run -d chrome

Tekan **F12**, buka device toolbar, atur ukuran **390 x 844**. Tekan `r` untuk hot reload dan `q` untuk berhenti.
