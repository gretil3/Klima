// Memastikan ThemeData Klima benar-benar dibangun dari token (langkah 2 Phase 1).

import 'package:flutter_test/flutter_test.dart';
import 'package:klima/core/theme/theme.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  group('KlimaTheme.light()', () {
    final theme = KlimaTheme.light();

    test('fontFamily Nunito ada di semua slot textTheme', () {
      final t = theme.textTheme;
      final slots = <String, TextStyle?>{
        'displayLarge': t.displayLarge,
        'displayMedium': t.displayMedium,
        'displaySmall': t.displaySmall,
        'headlineLarge': t.headlineLarge,
        'headlineMedium': t.headlineMedium,
        'headlineSmall': t.headlineSmall,
        'titleLarge': t.titleLarge,
        'titleMedium': t.titleMedium,
        'titleSmall': t.titleSmall,
        'bodyLarge': t.bodyLarge,
        'bodyMedium': t.bodyMedium,
        'bodySmall': t.bodySmall,
        'labelLarge': t.labelLarge,
        'labelMedium': t.labelMedium,
        'labelSmall': t.labelSmall,
      };
      for (final MapEntry(:key, :value) in slots.entries) {
        expect(value?.fontFamily, 'Nunito', reason: key);
      }
      expect(KlimaTypography.fontFamily, 'Nunito');
    });

    test('slot kunci memakai ukuran dan berat token, tanpa letterSpacing', () {
      final t = theme.textTheme;
      expect(t.displayLarge?.fontSize, KlimaTypography.display.fontSize);
      expect(t.headlineMedium?.fontSize, KlimaTypography.title.fontSize);
      expect(t.titleLarge?.fontSize, KlimaTypography.header.fontSize);
      expect(t.bodyMedium?.fontSize, KlimaTypography.body.fontSize);
      expect(t.bodyMedium?.fontWeight, FontWeight.w700);
      expect(t.bodyMedium?.height, KlimaTypography.lineHeight);
      // Material mengisi 0.25 jika dibiarkan null; Klima = 0.
      expect(t.bodyMedium?.letterSpacing, 0);
      expect(t.labelSmall?.fontSize, KlimaTypography.caption.fontSize);
      // Warna teks datang dari onSurface = forest.
      expect(t.bodyMedium?.color, KlimaColors.forest);
    });

    test('latar halaman = mintGround', () {
      expect(theme.scaffoldBackgroundColor, KlimaColors.mintGround);
    });

    test('ColorScheme dipetakan dari token', () {
      final c = theme.colorScheme;
      expect(c.primary, KlimaColors.forest);
      expect(c.onPrimary, KlimaColors.surface);
      expect(c.secondary, KlimaColors.orange);
      expect(c.onSecondary, KlimaColors.inkOnOrange);
      expect(c.tertiary, KlimaColors.lime);
      expect(c.surface, KlimaColors.surface);
      expect(c.onSurface, KlimaColors.forest);
    });

    test('ekstensi spirit bisa dibaca dari tema (default Kepik)', () {
      final ext = theme.extension<KlimaSpiritTheme>();
      expect(ext, isNotNull);
      expect(ext!.palette, same(SpiritPalette.kepik));

      final penyu = KlimaTheme.light(spirit: SpiritPalette.penyu);
      expect(
        penyu.extension<KlimaSpiritTheme>()!.palette,
        same(SpiritPalette.penyu),
      );
    });

    test('lerp spirit mencampur warna dan memindah id di tengah', () {
      const a = KlimaSpiritTheme(palette: SpiritPalette.kepik);
      const b = KlimaSpiritTheme(palette: SpiritPalette.penyu);
      expect(a.lerp(b, 0).palette.ground, SpiritPalette.kepik.ground);
      expect(a.lerp(b, 1).palette.ground, SpiritPalette.penyu.ground);
      expect(a.lerp(b, 0.4).palette.id, 'kepik');
      expect(a.lerp(b, 0.6).palette.id, 'penyu');
    });
  });

  testWidgets('Text tanpa gaya dirender dengan Nunito dari tema', (
    tester,
  ) async {
    late SpiritPalette fromContext;
    await tester.pumpWidget(
      MaterialApp(
        theme: KlimaTheme.light(spirit: SpiritPalette.bambu),
        home: Scaffold(
          body: Builder(
            builder: (context) {
              fromContext = KlimaSpiritTheme.of(context).palette;
              return const Text('Halo, Raka');
            },
          ),
        ),
      ),
    );

    final rich = tester.widget<RichText>(
      find.descendant(
        of: find.text('Halo, Raka'),
        matching: find.byType(RichText),
      ),
    );
    final style = rich.text.style!;
    expect(style.fontFamily, 'Nunito');
    expect(style.fontWeight, FontWeight.w700);
    expect(style.color, KlimaColors.forest);
    expect(fromContext, same(SpiritPalette.bambu));
  });
}
