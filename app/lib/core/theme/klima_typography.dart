// Skala tipografi Klima. Sumber: Figma section 42:282 "Type · Nunito" (frame 42:285).
// fontFamily SENGAJA belum diisi: Nunito dipasang di langkah 2 (ThemeData + font lokal).
// Warna juga tidak diisi di sini supaya gaya bisa dipakai di latar terang dan gelap.
//
// Tinggi baris: semua sampel di Figma = 115% ukuran huruf
// (48 -> 55.2, 28 -> 32.2, 24 -> 27.6, 17 -> 19.6, 15 -> 17.3, 13 -> 15, 12 -> 13.8;
// Figma membulatkan ke 1 desimal), jadi height = 1.15.
// Letter spacing: tidak ada di sampel tipografi (default 0), kecuali [captionCaps].

import 'package:flutter/painting.dart';

abstract final class KlimaTypography {
  /// Rasio tinggi baris yang dipakai semua gaya (115%).
  static const double lineHeight = 1.15;

  /// Display 48/900. Sampel "Klima", node 42:288.
  static const TextStyle display = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w900,
    height: lineHeight,
  );

  /// Title 28/900. Sampel "Pilih peran", node 42:291.
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w900,
    height: lineHeight,
  );

  /// Header 24/900. Sampel "Halo, Raka", node 42:294.
  static const TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    height: lineHeight,
  );

  /// Section 17/900. Sampel "Untuk kamu", node 42:297.
  static const TextStyle section = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w900,
    height: lineHeight,
  );

  /// Body 15/700. Sampel "Hutan Mangrove PIK", node 42:300.
  static const TextStyle body = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    height: lineHeight,
  );

  /// Meta 13/800. Sampel "Mulai 9 hari lagi", node 42:303.
  static const TextStyle meta = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w800,
    height: lineHeight,
  );

  /// Caption 12/900. Sampel "SAB, 31 OKT", node 42:306.
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w900,
    height: lineHeight,
  );

  /// Caption untuk label HURUF KAPITAL (tanggal "SAB, 31 OKT", kategori).
  /// Sama dengan [caption] + jarak huruf 1px. Sumber: tanggal di Event banner 38:252
  /// (tracking 1px). Huruf kapital kecil tanpa jarak terlihat terlalu rapat, jadi
  /// gaya ini dipakai untuk semua label kapital; [caption] untuk teks biasa.
  static const TextStyle captionCaps = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w900,
    height: lineHeight,
    letterSpacing: 1,
  );
}
