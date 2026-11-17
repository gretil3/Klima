// Token warna Klima. Sumber: Figma LzPq3LvBrqzZWlxXMsCNAS, halaman Assets (4:3).
// Nilai diambil dari fill swatch (bukan hanya label teks) lewat get_design_context.
// Nama mengikuti PERAN warna, bukan kode hex.

import 'package:flutter/painting.dart';

/// Warna inti Klima (aturan 60 / 30 / 10). Sumber: section 41:151.
abstract final class KlimaColors {
  // ---- 60 · Main ----

  /// Latar halaman. Figma "Mint ground", swatch 41:162.
  static const Color mintGround = Color(0xFFEEF4EE);

  /// Latar kartu. Figma "Surface", swatch 41:166.
  static const Color surface = Color(0xFFFCFCFC);

  // ---- 30 · Charm ----

  /// Tinta utama dan kartu gelap. Figma "Klima green", swatch 41:170.
  static const Color forest = Color(0xFF043C20);

  /// Teks sekunder. Figma "Green soft", swatch 41:174.
  static const Color greenSoft = Color(0xFF3A5F4C);

  /// Sorotan dan tile. Figma "Lime", swatch 41:178.
  static const Color lime = Color(0xFFA0E430);

  /// Isian berwarna tipis. Figma "Lime tint", swatch 41:182.
  static const Color limeTint = Color(0xFFE0F0D0);

  /// Tombol CTA dan label "Segera". Figma "Orange", swatch 41:186.
  static const Color orange = Color(0xFFFC683C);

  // ---- 10 · Spirit ----

  /// CONTOH accent 10% di Figma ("from the chosen spirit"), swatch 41:190.
  /// Keputusan tim 2026-11-17: hanya contoh, bukan peran warna. Di app, warna 10%
  /// selalu diambil dari [SpiritPalette] pilihan pengguna, jangan pakai konstanta ini di UI.
  static const Color spiritSample = Color(0xFFE2C4D3);

  // ---- Warna "di atas" (on-colour): tidak ada di halaman Assets, tapi dipakai di
  // komponen dan terbukti muncul di PNG layar (SourceGambarDesign & Report). ----

  /// Teks dan ikon di atas [orange]. Primary 36:160, chip "Segera" 38:251.
  static const Color inkOnOrange = Color(0xFF022414);

  /// Teks isi di atas kartu gelap [forest]. Event hero 38:264.
  static const Color textOnDark = Color(0xFFE4EDE7);

  /// Jalur progres (slot) di atas kartu gelap; isinya [lime]. Event hero 38:272.
  static const Color trackOnDark = Color(0xFF1F5A3B);

  // ---- Gradasi pendukung (41:195, 41:207, 41:219), urut terang ke gelap ----

  /// Figma "Mint shards" 41:196..41:204.
  static const Color mintShard1 = Color(0xFFDCEFDF);
  static const Color mintShard2 = Color(0xFFD4EAD9);
  static const Color mintShard3 = Color(0xFFC9E5D0);
  static const Color mintShard4 = Color(0xFFBFE0C9);
  static const Color mintShard5 = Color(0xFFA9D4B6);

  /// Figma "Lime facets" 41:208..41:216. Facet 4 sama dengan [lime].
  static const Color limeFacet1 = Color(0xFFD9F5A8);
  static const Color limeFacet2 = Color(0xFFC7F37F);
  static const Color limeFacet3 = Color(0xFFB9EF5E);
  static const Color limeFacet4 = Color(0xFFA0E430);
  static const Color limeFacet5 = Color(0xFF8FD11F);

  /// Figma "Deep green" 41:220..41:226. Deep green 4 sama dengan [forest].
  static const Color deepGreen1 = Color(0xFF1F7A4C);
  static const Color deepGreen2 = Color(0xFF13633F);
  static const Color deepGreen3 = Color(0xFF0B5233);
  static const Color deepGreen4 = Color(0xFF043C20);

  static const List<Color> mintShards = [
    mintShard1, mintShard2, mintShard3, mintShard4, mintShard5, //
  ];
  static const List<Color> limeFacets = [
    limeFacet1, limeFacet2, limeFacet3, limeFacet4, limeFacet5, //
  ];
  static const List<Color> deepGreens = [
    deepGreen1, deepGreen2, deepGreen3, deepGreen4, //
  ];
}

/// Rasio pemakaian warna (persen layar). Sumber: bar 41:155 (41:156, 41:158, 41:160).
abstract final class KlimaColorRatio {
  static const int main = 60;
  static const int charm = 30;
  static const int spirit = 10;
}

/// Palet satu spirit. Sumber: section 41:228 (frame 41:231).
/// Peran tiap warna mengikuti label swatch di Figma:
/// ground = latar kartu, platform = alas mascot, side = sisi alas, ink = teks dan bayangan.
final class SpiritPalette {
  const SpiritPalette({
    required this.id,
    required this.displayName,
    required this.ground,
    required this.platform,
    required this.side,
    required this.ink,
  });

  /// Kunci stabil untuk disimpan (mis. di Firestore).
  final String id;

  /// Nama yang tampil di UI.
  final String displayName;

  final Color ground;
  final Color platform;
  final Color side;
  final Color ink;

  /// Swatch 41:247, 41:250, 41:253, 41:256.
  static const SpiritPalette kepik = SpiritPalette(
    id: 'kepik',
    displayName: 'Kepik',
    ground: Color(0xFFF3E4EC),
    platform: Color(0xFFCFA6BB),
    side: Color(0xFFA8788C),
    ink: Color(0xFF4A2640),
  );

  /// Swatch 41:274, 41:277, 41:280, 41:283.
  static const SpiritPalette lebah = SpiritPalette(
    id: 'lebah',
    displayName: 'Lebah',
    ground: Color(0xFFFBF0D9),
    platform: Color(0xFFE4B25A),
    side: Color(0xFFC48A2A),
    ink: Color(0xFF5A3A08),
  );

  /// Swatch 41:301, 41:304, 41:307, 41:310.
  static const SpiritPalette penyu = SpiritPalette(
    id: 'penyu',
    displayName: 'Penyu',
    ground: Color(0xFFE6F0FB),
    platform: Color(0xFF8FB6E8),
    side: Color(0xFF3D7FD6),
    ink: Color(0xFF0F3A78),
  );

  /// Swatch 41:328, 41:331, 41:334, 41:337.
  static const SpiritPalette berang = SpiritPalette(
    id: 'berang',
    displayName: 'Berang',
    ground: Color(0xFFF5ECDC),
    platform: Color(0xFFC9A465),
    side: Color(0xFFA07A2C),
    ink: Color(0xFF4F3A12),
  );

  /// Swatch 41:355, 41:358, 41:361, 41:364.
  static const SpiritPalette mangrove = SpiritPalette(
    id: 'mangrove',
    displayName: 'Mangrove',
    ground: Color(0xFFE7F2E1),
    platform: Color(0xFF98C47F),
    side: Color(0xFF5A8F45),
    ink: Color(0xFF1F4A1C),
  );

  /// Swatch 41:382, 41:385, 41:388, 41:391.
  static const SpiritPalette anggrek = SpiritPalette(
    id: 'anggrek',
    displayName: 'Anggrek',
    ground: Color(0xFFEEF5EC),
    platform: Color(0xFFA7CC9C),
    side: Color(0xFF6A9A68),
    ink: Color(0xFF24502E),
  );

  /// Swatch 41:409, 41:412, 41:415, 41:418.
  static const SpiritPalette bambu = SpiritPalette(
    id: 'bambu',
    displayName: 'Bambu',
    ground: Color(0xFFF1F6DE),
    platform: Color(0xFFB4CC6C),
    side: Color(0xFF7F9A3A),
    ink: Color(0xFF34501A),
  );

  /// Ketujuh spirit, urutan sama dengan Figma 41:231.
  static const List<SpiritPalette> all = [
    kepik, lebah, penyu, berang, mangrove, anggrek, bambu, //
  ];

  /// Cari palet dari [id]; null jika tidak dikenal.
  static SpiritPalette? byId(String id) {
    for (final p in all) {
      if (p.id == id) return p;
    }
    return null;
  }
}
