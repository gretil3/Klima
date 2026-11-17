// Bayangan keras ("solid offset") Klima: geser ke kanan-bawah, TANPA blur, TANPA spread.
// Sumber: Figma section 42:307 "Layout", kotak "Shadow" 42:336, dicek ulang di komponen
// halaman Components (36:151 Tombol, 38:208 Kartu).

import 'package:flutter/painting.dart';

import 'klima_colors.dart';

abstract final class KlimaShadows {
  /// 3px forest, untuk kartu. Spesimen 42:337 ("3 card").
  /// Dipakai di: Event row 38:290, Share action 36:182, Icon button 36:194.
  static const List<BoxShadow> card = [
    BoxShadow(
      color: KlimaColors.forest,
      offset: Offset(3, 3),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];

  /// 4px forest, untuk tombol utama. Spesimen 42:339 ("4 button").
  /// Dipakai di: Primary 36:159.
  static const List<BoxShadow> button = [
    BoxShadow(
      color: KlimaColors.forest,
      offset: Offset(4, 4),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];

  /// 6px lime, untuk kartu unggulan gelap. Spesimen 42:341 ("6 feature").
  /// Dipakai di: Event hero 38:261.
  static const List<BoxShadow> feature = [
    BoxShadow(
      color: KlimaColors.lime,
      offset: Offset(6, 6),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];

  /// 3px warna tinta spirit. Spesimen 42:343 ("3 spirit", contoh Kepik #4a2640).
  /// Dipakai di: Icon button 36:203, Pill action 36:220. Isi [ink] dengan `SpiritPalette.ink`.
  static List<BoxShadow> spirit(Color ink) => [
    BoxShadow(
      color: ink,
      offset: const Offset(3, 3),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];

  /// 4px warna tinta spirit, untuk kartu hero spirit.
  /// Dipakai di: Spirit hero 38:215 dan kartu spirit di Assets 41:232..41:394.
  /// Keputusan tim 2026-11-17: ikuti komponen (4px), walau spesimen Layout menulis "3 spirit".
  static List<BoxShadow> spiritHero(Color ink) => [
    BoxShadow(
      color: ink,
      offset: const Offset(4, 4),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];
}
