// Radius sudut dan tebal garis Klima. Sumber: Figma section 42:307 "Layout", kotak "Radius" 42:325.

import 'package:flutter/painting.dart';

abstract final class KlimaRadii {
  /// 12, untuk tile. Spesimen 42:326 ("12 tile").
  static const double tile = 12;

  /// 18, untuk kartu (dan tombol 56h: Primary 36:159, Secondary 36:171). Spesimen 42:328 ("18 card").
  ///
  /// Keputusan tim 2026-11-17 (radius di luar skala dibulatkan ke skala):
  /// - Share action 36:182 dan wadah Round action 36:238: Figma 16 -> 18.
  /// - Event banner 38:243: Figma 22 -> 18. 22 tepat di tengah 18 dan 26; dipilih 18
  ///   karena perannya kartu biasa, bukan hero.
  static const double card = 18;

  /// 26, untuk kartu hero (Spirit hero 38:215, Event hero 38:261). Spesimen 42:330 ("26 hero").
  static const double hero = 26;

  /// Pill: setengah tinggi elemen. Spesimen 42:332 ("pill", 72h, r36).
  /// Nilai besar ini membuat sudut selalu setengah lingkaran, berapa pun tingginya.
  static const double pill = 999;

  static const BorderRadius tileAll = BorderRadius.all(Radius.circular(tile));
  static const BorderRadius cardAll = BorderRadius.all(Radius.circular(card));
  static const BorderRadius heroAll = BorderRadius.all(Radius.circular(hero));
  static const BorderRadius pillAll = BorderRadius.all(Radius.circular(pill));
}

/// Tebal garis tepi.
abstract final class KlimaStroke {
  /// 2px warna forest. Spesimen radius 42:326..42:332, Secondary 36:171, Filter chip 36:228.
  static const double outline = 2;
}
