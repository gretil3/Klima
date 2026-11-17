// Path aset gambar Klima. Pakai konstanta ini, jangan tulis string path di widget,
// supaya salah ketik tertangkap tes (test/core/assets/klima_assets_test.dart).
//
// Mascot punya 3 kepadatan (lihat app/assets/README.md):
//   assets/mascots/<id>.png        160 px  (1.0x)
//   assets/mascots/2.0x/<id>.png   320 px
//   assets/mascots/3.0x/<id>.png   480 px
// Flutter memilih varian otomatis; kode cukup memakai path 1.0x.
// Ukuran tampil terbesar di Figma = 160 x 160 (Profil 32:101), jadi 3.0x tetap tajam.

import '../theme/klima_colors.dart';

abstract final class KlimaAssets {
  static const String _mascotDir = 'assets/mascots';

  /// Ilustrasi utama layar "Selamat datang" (Figma img-hero 26:8, dipakai di 29:20).
  /// Gambar persegi 1000 x 1000, buram (bukan transparan); dipotong dengan BoxFit.cover.
  static const String hero = 'assets/illustrations/hero.png';

  /// Path mascot untuk id spirit (`SpiritPalette.id`).
  static String mascot(String spiritId) => '$_mascotDir/$spiritId.png';

  /// Semua path mascot, urutan sama dengan [SpiritPalette.all].
  static List<String> get allMascots => [
    for (final p in SpiritPalette.all) mascot(p.id),
  ];
}

/// `SpiritPalette.kepik.mascot` -> 'assets/mascots/kepik.png'.
extension SpiritMascot on SpiritPalette {
  String get mascot => KlimaAssets.mascot(id);
}
