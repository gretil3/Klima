# Klima

Aplikasi seluler untuk menemukan event lingkungan di sekitar, mendaftar, lalu check-in dengan kode QR. Hanya kehadiran yang terverifikasi yang dihitung: tanpa poin dan tanpa peringkat.

Study2Challenge 2026, tim B4-1. Tema: *Humanizing Tech*. SDG 13 (Climate Action).

## Teknologi
Flutter (Android dulu) dan Firebase (Authentication, Firestore, Remote Config, App Check; Cloud Functions menyusul).

## Struktur

| Folder | Isi |
|---|---|
| `app/` | Aplikasi Flutter (application ID `id.klima.app`) |
| `design/` | Gambar acuan Figma dan peta node (lihat `design/README.md`) |
| `docs/` | Rencana kerja per fase (mulai dari `docs/PHASE1.md`) |
| `firebase/` | Rules dan konfigurasi Firebase (menyusul di Phase 3) |
| `functions/` | Cloud Functions (menyusul) |

Dokumen sumber di root: proposal PDF (sumber kebenaran produk) dan tautan Figma.

## Status
- Phase 0 selesai: lingkungan siap, Firebase `klima-dev` tersambung dan teruji di Chrome dan HP.
- Phase 1 berikutnya: design system dan rangka navigasi.

## Menjalankan di Chrome
Dari folder `app/`:

    flutter run -d chrome

Gunakan ukuran layar 390 x 844 di device toolbar Chrome.
