// Memastikan nilai token kunci sama dengan Figma (file LzPq3LvBrqzZWlxXMsCNAS).
// Jika tes ini gagal, berarti ada yang mengubah token tanpa mengecek Figma.

import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klima/core/theme/tokens.dart';

void main() {
  group('Warna (Figma 41:151, 41:228)', () {
    test('warna inti sama dengan swatch', () {
      expect(KlimaColors.mintGround, const Color(0xFFEEF4EE)); // 41:162
      expect(KlimaColors.forest, const Color(0xFF043C20)); // 41:170
      expect(KlimaColors.lime, const Color(0xFFA0E430)); // 41:178
      expect(KlimaColors.orange, const Color(0xFFFC683C)); // 41:186
    });

    test('warna on-colour dari komponen', () {
      expect(KlimaColors.inkOnOrange, const Color(0xFF022414)); // 36:160
      expect(KlimaColors.textOnDark, const Color(0xFFE4EDE7)); // 38:264
      expect(KlimaColors.trackOnDark, const Color(0xFF1F5A3B)); // 38:272
    });

    test('ada 7 spirit, urut seperti Figma', () {
      expect(SpiritPalette.all.map((p) => p.id), [
        'kepik',
        'lebah',
        'penyu',
        'berang',
        'mangrove',
        'anggrek',
        'bambu',
      ]);
      expect(SpiritPalette.kepik.ink, const Color(0xFF4A2640)); // 41:256
      expect(SpiritPalette.byId('penyu'), SpiritPalette.penyu);
      expect(SpiritPalette.byId('tidak-ada'), isNull);
    });
  });

  group('Tipografi (Figma 42:282)', () {
    test('Display 48/900', () {
      expect(KlimaTypography.display.fontSize, 48);
      expect(KlimaTypography.display.fontWeight, FontWeight.w900);
      expect(KlimaTypography.display.height, 1.15);
    });

    test('Body 15/700', () {
      expect(KlimaTypography.body.fontSize, 15);
      expect(KlimaTypography.body.fontWeight, FontWeight.w700);
    });

    test('Caption kapital = caption + jarak huruf 1px (38:252)', () {
      expect(
        KlimaTypography.captionCaps.fontSize,
        KlimaTypography.caption.fontSize,
      );
      expect(
        KlimaTypography.captionCaps.fontWeight,
        KlimaTypography.caption.fontWeight,
      );
      expect(KlimaTypography.captionCaps.letterSpacing, 1);
    });
  });

  group('Bayangan keras (Figma 42:339, 36:159)', () {
    test('tombol: 4px forest, tanpa blur', () {
      final shadow = KlimaShadows.button.single;
      expect(shadow.offset, const Offset(4, 4));
      expect(shadow.blurRadius, 0);
      expect(shadow.spreadRadius, 0);
      expect(shadow.color, KlimaColors.forest);
    });
  });
}
