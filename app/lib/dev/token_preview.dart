// Halaman pratinjau token desain (khusus pengembangan, BUKAN bagian app).
// Jalankan terpisah dari main.dart:
//   flutter run -d chrome -t lib/dev/token_preview.dart
// Memakai KlimaTheme.light() (langkah 2): Nunito lokal + ThemeData dari token.

import 'package:material_ui/material_ui.dart';

import '../core/assets/klima_assets.dart';
import '../core/theme/theme.dart';

void main() => runApp(const TokenPreviewApp());

class TokenPreviewApp extends StatelessWidget {
  const TokenPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klima · Token',
      debugShowCheckedModeBanner: false,
      theme: KlimaTheme.light(),
      home: const TokenPreviewPage(),
    );
  }
}

class TokenPreviewPage extends StatelessWidget {
  const TokenPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Latar mintGround sekarang datang dari tema (scaffoldBackgroundColor).
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            KlimaLayout.sideMargin,
            KlimaSpacing.xl,
            KlimaLayout.sideMargin,
            48,
          ),
          children: const [
            _Intro(),
            _ColourSection(),
            _RampSection(),
            _SpiritSection(),
            _TypeSection(),
            _WeightSection(),
            _AssetSection(),
            _SpacingSection(),
            _RadiusSection(),
            _ShadowSection(),
            _ComboSection(),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------- helpers

String _hex(Color c) =>
    '#${c.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';

TextStyle _ink(TextStyle s, [Color color = KlimaColors.forest]) =>
    s.copyWith(color: color);

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.node,
    required this.child,
    this.fromFigma = true,
  });

  final String title;
  final String node;
  final Widget child;

  /// false untuk bagian yang bukan dari node Figma (mis. sketsa gabungan).
  final bool fromFigma;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _ink(KlimaTypography.header)),
          const SizedBox(height: 2),
          Text(
            fromFigma ? 'Figma $node' : node,
            style: _ink(KlimaTypography.meta, KlimaColors.greenSoft),
          ),
          const SizedBox(height: KlimaSpacing.md),
          child,
        ],
      ),
    );
  }
}

/// Grid dua kolom selebar layar.
class _TwoColumn extends StatelessWidget {
  const _TwoColumn({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        final w = (box.maxWidth - KlimaSpacing.sm) / 2;
        return Wrap(
          spacing: KlimaSpacing.sm,
          runSpacing: KlimaSpacing.md,
          children: [for (final c in children) SizedBox(width: w, child: c)],
        );
      },
    );
  }
}

// ---------------------------------------------------------------- intro

class _Intro extends StatelessWidget {
  const _Intro();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Klima', style: _ink(KlimaTypography.display)),
        Text('Token desain · langkah 3', style: _ink(KlimaTypography.title)),
        const SizedBox(height: KlimaSpacing.sm),
        Container(
          padding: const EdgeInsets.all(KlimaSpacing.sm),
          decoration: const BoxDecoration(
            color: KlimaColors.limeTint,
            borderRadius: KlimaRadii.tileAll,
          ),
          child: Text(
            'Semua nilai di halaman ini dibaca dari konstanta di '
            'lib/core/theme/. Font Nunito dibundel lokal (700/800/900), tema dari KlimaTheme.light().',
            style: _ink(KlimaTypography.meta),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------- colours

class _ColourSection extends StatelessWidget {
  const _ColourSection();

  static const _swatches = <(String, Color, String)>[
    ('mintGround', KlimaColors.mintGround, '60 · latar halaman'),
    ('surface', KlimaColors.surface, '60 · kartu'),
    ('forest', KlimaColors.forest, '30 · tinta, kartu gelap'),
    ('greenSoft', KlimaColors.greenSoft, '30 · teks sekunder'),
    ('lime', KlimaColors.lime, '30 · sorotan, tile'),
    ('limeTint', KlimaColors.limeTint, '30 · isian tipis'),
    ('orange', KlimaColors.orange, 'CTA · Segera'),
    ('spiritSample', KlimaColors.spiritSample, '10 · contoh saja'),
    ('inkOnOrange', KlimaColors.inkOnOrange, 'teks di atas oranye'),
    ('textOnDark', KlimaColors.textOnDark, 'teks di kartu gelap'),
    ('trackOnDark', KlimaColors.trackOnDark, 'jalur slot di gelap'),
  ];

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Warna 60 / 30 / 10',
      node: '41:151',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _RatioBar(),
          const SizedBox(height: KlimaSpacing.lg),
          _TwoColumn(
            children: [
              for (final (name, color, role) in _swatches)
                _Swatch(name: name, color: color, role: role),
            ],
          ),
        ],
      ),
    );
  }
}

class _RatioBar extends StatelessWidget {
  const _RatioBar();

  @override
  Widget build(BuildContext context) {
    Widget part(int flex, Gradient? g, Color? c, String label, Color text) =>
        Expanded(
          flex: flex,
          child: Container(
            height: 40,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: KlimaSpacing.xs),
            decoration: BoxDecoration(gradient: g, color: c),
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: _ink(KlimaTypography.caption, text),
            ),
          ),
        );

    return ClipRRect(
      borderRadius: KlimaRadii.tileAll,
      child: Row(
        children: [
          part(
            KlimaColorRatio.main,
            const LinearGradient(
              colors: [
                KlimaColors.mintGround,
                KlimaColors.mintGround,
                KlimaColors.surface,
              ],
              stops: [0, 0.7, 0.7],
            ),
            null,
            '60 · Main',
            KlimaColors.forest,
          ),
          part(
            KlimaColorRatio.charm,
            const LinearGradient(
              colors: [
                KlimaColors.forest,
                KlimaColors.forest,
                KlimaColors.lime,
              ],
              stops: [0, 0.6, 0.6],
            ),
            null,
            '30 · Charm',
            KlimaColors.surface,
          ),
          part(
            KlimaColorRatio.spirit,
            null,
            KlimaColors.spiritSample,
            '10',
            SpiritPalette.kepik.ink,
          ),
        ],
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch({required this.name, required this.color, required this.role});

  final String name;
  final Color color;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 64,
          decoration: BoxDecoration(
            color: color,
            borderRadius: KlimaRadii.cardAll,
            border: Border.all(color: KlimaColors.mintShard4),
          ),
        ),
        const SizedBox(height: KlimaSpacing.xs),
        Text(
          name,
          style: _ink(
            KlimaTypography.body.copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        Text(
          _hex(color),
          style: _ink(KlimaTypography.meta, KlimaColors.greenSoft),
        ),
        Text(role, style: _ink(KlimaTypography.caption, KlimaColors.greenSoft)),
      ],
    );
  }
}

class _RampSection extends StatelessWidget {
  const _RampSection();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Gradasi',
      node: '41:195 · 41:207 · 41:219',
      child: Column(
        children: [
          _Ramp('Mint shards', KlimaColors.mintShards, KlimaColors.forest),
          _Ramp('Lime facets', KlimaColors.limeFacets, KlimaColors.forest),
          _Ramp('Deep green', KlimaColors.deepGreens, KlimaColors.surface),
        ],
      ),
    );
  }
}

class _Ramp extends StatelessWidget {
  const _Ramp(this.label, this.colors, this.textColor);

  final String label;
  final List<Color> colors;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: KlimaSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: _ink(KlimaTypography.meta)),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: KlimaRadii.tileAll,
            child: Row(
              children: [
                for (final c in colors)
                  Expanded(
                    child: Container(
                      height: 52,
                      color: c,
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        _hex(c).substring(1),
                        style: _ink(
                          KlimaTypography.caption.copyWith(fontSize: 10),
                          textColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------- spirits

class _SpiritSection extends StatelessWidget {
  const _SpiritSection();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Spirit',
      node: '41:228 · bayangan spiritHero 4px',
      child: Column(
        children: [for (final p in SpiritPalette.all) _SpiritCard(p)],
      ),
    );
  }
}

class _SpiritCard extends StatelessWidget {
  const _SpiritCard(this.p);

  final SpiritPalette p;

  @override
  Widget build(BuildContext context) {
    final roles = <(String, Color)>[
      ('ground', p.ground),
      ('platform', p.platform),
      ('side', p.side),
      ('ink', p.ink),
    ];
    return Container(
      margin: const EdgeInsets.only(bottom: KlimaSpacing.lg),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: p.ground,
        borderRadius: KlimaRadii.heroAll,
        boxShadow: KlimaShadows.spiritHero(p.ink),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  p.displayName,
                  style: _ink(KlimaTypography.header, p.ink),
                ),
              ),
              // Alas mascot sederhana: platform di atas, side di bawah.
              Column(
                children: [
                  Container(
                    width: 72,
                    height: 14,
                    decoration: BoxDecoration(
                      color: p.platform,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(7),
                      ),
                    ),
                  ),
                  Container(width: 72, height: 8, color: p.side),
                ],
              ),
            ],
          ),
          const SizedBox(height: KlimaSpacing.sm),
          Row(
            children: [
              for (final (name, c) in roles)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 28,
                          decoration: BoxDecoration(
                            color: c,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(color: p.platform),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(name, style: _ink(KlimaTypography.caption, p.ink)),
                        Text(
                          _hex(c),
                          style: _ink(
                            KlimaTypography.caption.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                            p.ink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------- type

class _TypeSection extends StatelessWidget {
  const _TypeSection();

  static const _rows = <(String, TextStyle, String, String)>[
    ('display', KlimaTypography.display, '48 / 900 · 42:288', 'Klima'),
    ('title', KlimaTypography.title, '28 / 900 · 42:291', 'Pilih peran'),
    ('header', KlimaTypography.header, '24 / 900 · 42:294', 'Halo, Raka'),
    ('section', KlimaTypography.section, '17 / 900 · 42:297', 'Untuk kamu'),
    ('body', KlimaTypography.body, '15 / 700 · 42:300', 'Hutan Mangrove PIK'),
    ('meta', KlimaTypography.meta, '13 / 800 · 42:303', 'Mulai 9 hari lagi'),
    ('caption', KlimaTypography.caption, '12 / 900 · 42:306', 'Sab, 31 Okt'),
    (
      'captionCaps',
      KlimaTypography.captionCaps,
      '12 / 900 · +1px · 38:252',
      'SAB, 31 OKT',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Tipografi',
      node: '42:282 · tinggi baris 115%',
      child: Container(
        decoration: const BoxDecoration(
          color: KlimaColors.surface,
          borderRadius: KlimaRadii.cardAll,
          boxShadow: KlimaShadows.card,
        ),
        child: Column(
          children: [
            for (var i = 0; i < _rows.length; i++)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: KlimaSpacing.md,
                  vertical: KlimaSpacing.sm,
                ),
                decoration: BoxDecoration(
                  border: i == _rows.length - 1
                      ? null
                      : const Border(
                          bottom: BorderSide(color: KlimaColors.mintShard2),
                        ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_rows[i].$1} · ${_rows[i].$3}',
                      style: _ink(
                        KlimaTypography.caption,
                        KlimaColors.greenSoft,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(_rows[i].$4, style: _ink(_rows[i].$2)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Bukti langkah 2: tiga berat Nunito harus terlihat berbeda, teks TANPA gaya
/// mengikuti tema (bodyMedium = body 15/700, warna onSurface = forest), dan warna
/// spirit dibaca dari ThemeExtension, bukan dari konstanta.
class _WeightSection extends StatelessWidget {
  const _WeightSection();

  @override
  Widget build(BuildContext context) {
    final spirit = KlimaSpiritTheme.of(context).palette;
    final base = KlimaTypography.header;
    return _Section(
      title: 'Berat Nunito',
      node: 'Font lokal · 700 / 800 / 900',
      fromFigma: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(KlimaSpacing.md),
        decoration: const BoxDecoration(
          color: KlimaColors.surface,
          borderRadius: KlimaRadii.cardAll,
          boxShadow: KlimaShadows.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final (label, w) in const [
              ('700 Bold', FontWeight.w700),
              ('800 ExtraBold', FontWeight.w800),
              ('900 Black', FontWeight.w900),
            ]) ...[
              Text(
                label,
                style: _ink(KlimaTypography.caption, KlimaColors.greenSoft),
              ),
              Text(
                'Hutan Mangrove PIK',
                style: _ink(base.copyWith(fontWeight: w)),
              ),
              const SizedBox(height: KlimaSpacing.xs),
            ],
            const Divider(height: KlimaSpacing.xl),
            Text(
              'Teks tanpa gaya (dari tema)',
              style: _ink(KlimaTypography.caption, KlimaColors.greenSoft),
            ),
            const Text('Mulai 9 hari lagi di Jakarta Utara'),
            const SizedBox(height: KlimaSpacing.md),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: KlimaSpacing.sm,
                vertical: KlimaSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: spirit.ground,
                borderRadius: KlimaRadii.pillAll,
                border: Border.all(color: spirit.platform),
              ),
              child: Text(
                'Spirit dari tema: ${spirit.displayName}',
                style: _ink(KlimaTypography.meta, spirit.ink),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------- assets

/// Bukti langkah 3: hero dipotong seperti Figma 29:20 (390 x 466, cover), dan tiap
/// mascot tampil di atas papan catur (latar transparan terlihat menembus) dan di atas
/// warna ground spiritnya, dalam ukuran Profil (160), Spirit hero (148) dan avatar (26).
class _AssetSection extends StatelessWidget {
  const _AssetSection();

  @override
  Widget build(BuildContext context) {
    final spirit = KlimaSpiritTheme.of(context).palette;
    return _Section(
      title: 'Aset gambar',
      node: '26:2..26:8 · 17:3',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'hero · 390 × 466 · cover (29:20)',
            style: _ink(KlimaTypography.meta),
          ),
          const SizedBox(height: KlimaSpacing.xs),
          ClipRRect(
            borderRadius: KlimaRadii.tileAll,
            child: AspectRatio(
              aspectRatio: 390 / 466,
              child: Image.asset(KlimaAssets.hero, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: KlimaSpacing.lg),
          Text(
            'mascot ${spirit.displayName} · 160 (Profil 32:101)',
            style: _ink(KlimaTypography.meta),
          ),
          const SizedBox(height: KlimaSpacing.xs),
          Row(
            children: [
              _Checker(child: Image.asset(spirit.mascot, width: 160)),
              const SizedBox(width: KlimaSpacing.sm),
              Expanded(
                child: Container(
                  height: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: spirit.ground,
                    borderRadius: KlimaRadii.cardAll,
                  ),
                  child: Image.asset(spirit.mascot, width: 148),
                ),
              ),
            ],
          ),
          const SizedBox(height: KlimaSpacing.lg),
          for (final p in SpiritPalette.all) _MascotRow(p),
        ],
      ),
    );
  }
}

class _MascotRow extends StatelessWidget {
  const _MascotRow(this.p);

  final SpiritPalette p;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: KlimaSpacing.sm),
      child: Row(
        children: [
          _Checker(size: 72, child: Image.asset(p.mascot, width: 72)),
          const SizedBox(width: KlimaSpacing.xs),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: p.ground,
              borderRadius: KlimaRadii.tileAll,
              boxShadow: KlimaShadows.spirit(p.ink),
            ),
            child: Image.asset(p.mascot),
          ),
          const SizedBox(width: KlimaSpacing.sm),
          // Avatar Circle 31:292: lingkaran 32 dengan gambar 26.
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: p.ground,
              shape: BoxShape.circle,
              border: Border.all(color: p.platform),
            ),
            child: Image.asset(p.mascot, width: 26),
          ),
          const SizedBox(width: KlimaSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.displayName, style: _ink(KlimaTypography.section)),
                Text(
                  p.mascot,
                  style: _ink(KlimaTypography.caption, KlimaColors.greenSoft),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Papan catur abu-abu: bagian transparan gambar akan memperlihatkan pola ini.
class _Checker extends StatelessWidget {
  const _Checker({required this.child, this.size = 160});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: KlimaRadii.tileAll,
      child: CustomPaint(
        painter: const _CheckerPainter(),
        child: SizedBox.square(dimension: size, child: child),
      ),
    );
  }
}

class _CheckerPainter extends CustomPainter {
  const _CheckerPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const cell = 8.0;
    final light = Paint()..color = const Color(0xFFFFFFFF);
    final dark = Paint()..color = const Color(0xFFD0D0D0);
    for (var y = 0.0; y < size.height; y += cell) {
      for (var x = 0.0; x < size.width; x += cell) {
        final odd = ((x / cell).floor() + (y / cell).floor()).isOdd;
        canvas.drawRect(Rect.fromLTWH(x, y, cell, cell), odd ? dark : light);
      }
    }
  }

  @override
  bool shouldRepaint(_CheckerPainter oldDelegate) => false;
}

// ---------------------------------------------------------------- layout

class _SpacingSection extends StatelessWidget {
  const _SpacingSection();

  static const _steps = <(String, double)>[
    ('xs', KlimaSpacing.xs),
    ('sm', KlimaSpacing.sm),
    ('md', KlimaSpacing.md),
    ('lg', KlimaSpacing.lg),
    ('xl', KlimaSpacing.xl),
  ];

  static const _layout = <(String, double)>[
    ('sideMargin', KlimaLayout.sideMargin),
    ('contentTop', KlimaLayout.contentTop),
    ('buttonsFromBottom', KlimaLayout.buttonsFromBottom),
    ('minTouchTarget', KlimaLayout.minTouchTarget),
    ('buttonHeight', KlimaLayout.buttonHeight),
    ('rowHeight', KlimaLayout.rowHeight),
    ('chipHeight', KlimaLayout.chipHeight),
  ];

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Spasi dan bingkai',
      node: '42:313 · 42:347',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final (name, v) in _steps)
                Padding(
                  padding: const EdgeInsets.only(right: KlimaSpacing.lg),
                  child: Column(
                    children: [
                      Container(
                        width: v,
                        height: v,
                        decoration: const BoxDecoration(
                          color: KlimaColors.lime,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(name, style: _ink(KlimaTypography.caption)),
                      Text(
                        v.toInt().toString(),
                        style: _ink(
                          KlimaTypography.caption,
                          KlimaColors.greenSoft,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: KlimaSpacing.md),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(KlimaSpacing.md),
            decoration: const BoxDecoration(
              color: KlimaColors.surface,
              borderRadius: KlimaRadii.cardAll,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frame ${KlimaLayout.frameWidth.toInt()} × ${KlimaLayout.frameHeight.toInt()}',
                  style: _ink(KlimaTypography.section),
                ),
                const SizedBox(height: 6),
                for (final (name, v) in _layout)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(name, style: _ink(KlimaTypography.meta)),
                        ),
                        Text(
                          '${v.toInt()}',
                          style: _ink(
                            KlimaTypography.meta,
                            KlimaColors.greenSoft,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Specimen extends StatelessWidget {
  const _Specimen({
    required this.label,
    required this.sub,
    required this.decoration,
  });

  final String label;
  final String sub;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 72, decoration: decoration),
        const SizedBox(height: KlimaSpacing.xs),
        Text(label, style: _ink(KlimaTypography.meta)),
        Text(sub, style: _ink(KlimaTypography.caption, KlimaColors.greenSoft)),
      ],
    );
  }
}

class _RadiusSection extends StatelessWidget {
  const _RadiusSection();

  static const _items = <(String, double, String)>[
    ('tile', KlimaRadii.tile, '12 · 42:326'),
    ('card', KlimaRadii.card, '18 · 42:328 (juga 16 & 22)'),
    ('hero', KlimaRadii.hero, '26 · 42:330'),
    ('pill', KlimaRadii.pill, 'setengah tinggi · 42:332'),
  ];

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Radius dan garis',
      node: '42:325 · garis 2px',
      child: _TwoColumn(
        children: [
          for (final (name, r, sub) in _items)
            _Specimen(
              label: name,
              sub: sub,
              decoration: BoxDecoration(
                color: KlimaColors.surface,
                borderRadius: BorderRadius.all(Radius.circular(r)),
                border: Border.all(
                  color: KlimaColors.forest,
                  width: KlimaStroke.outline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ShadowSection extends StatelessWidget {
  const _ShadowSection();

  @override
  Widget build(BuildContext context) {
    BoxDecoration d(List<BoxShadow> s) => BoxDecoration(
      color: KlimaColors.surface,
      borderRadius: KlimaRadii.cardAll,
      boxShadow: s,
    );
    return _Section(
      title: 'Bayangan keras',
      node: '42:336 · tanpa blur',
      child: _TwoColumn(
        children: [
          _Specimen(
            label: 'card',
            sub: '3px forest · 42:337',
            decoration: d(KlimaShadows.card),
          ),
          _Specimen(
            label: 'button',
            sub: '4px forest · 42:339',
            decoration: d(KlimaShadows.button),
          ),
          _Specimen(
            label: 'feature',
            sub: '6px lime · 42:341',
            decoration: d(KlimaShadows.feature),
          ),
          _Specimen(
            label: 'spirit(ink)',
            sub: '3px tinta spirit · 42:343',
            decoration: d(KlimaShadows.spirit(SpiritPalette.kepik.ink)),
          ),
          _Specimen(
            label: 'spiritHero(ink)',
            sub: '4px tinta spirit · 38:215',
            decoration: d(KlimaShadows.spiritHero(SpiritPalette.penyu.ink)),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------- combo

/// Sketsa cepat yang menggabungkan token. BUKAN komponen final (itu langkah 4 dst).
class _ComboSection extends StatelessWidget {
  const _ComboSection();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Contoh gabungan',
      node: 'Sketsa, bukan komponen final',
      fromFigma: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Primary: oranye, r18, bayangan button 4px, teks inkOnOrange.
          Container(
            height: KlimaLayout.buttonHeight,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: KlimaColors.orange,
              borderRadius: KlimaRadii.cardAll,
              boxShadow: KlimaShadows.button,
            ),
            child: Text(
              'Gabung event',
              style: _ink(KlimaTypography.section, KlimaColors.inkOnOrange),
            ),
          ),
          const SizedBox(height: KlimaSpacing.md),
          // Secondary: surface, garis 2px forest.
          Container(
            height: KlimaLayout.buttonHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: KlimaColors.surface,
              borderRadius: KlimaRadii.cardAll,
              border: Border.all(
                color: KlimaColors.forest,
                width: KlimaStroke.outline,
              ),
            ),
            child: Text(
              'Kembali ke Beranda',
              style: _ink(KlimaTypography.section),
            ),
          ),
          const SizedBox(height: KlimaSpacing.xl),
          // Kartu gelap: forest, bayangan feature, teks textOnDark, jalur trackOnDark.
          Container(
            padding: const EdgeInsets.all(KlimaSpacing.lg),
            decoration: const BoxDecoration(
              color: KlimaColors.forest,
              borderRadius: KlimaRadii.heroAll,
              boxShadow: KlimaShadows.feature,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: const BoxDecoration(
                    color: KlimaColors.orange,
                    borderRadius: KlimaRadii.pillAll,
                  ),
                  child: Text(
                    'Segera',
                    style: _ink(
                      KlimaTypography.caption,
                      KlimaColors.inkOnOrange,
                    ),
                  ),
                ),
                const SizedBox(height: KlimaSpacing.sm),
                Text(
                  'SAB, 31 OKT',
                  style: _ink(KlimaTypography.captionCaps, KlimaColors.lime),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tanam 100 Mangrove',
                  style: _ink(KlimaTypography.title, KlimaColors.surface),
                ),
                const SizedBox(height: KlimaSpacing.xs),
                Text(
                  'Hutan Mangrove PIK',
                  style: _ink(KlimaTypography.body, KlimaColors.textOnDark),
                ),
                const SizedBox(height: KlimaSpacing.md),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        child: SizedBox(
                          height: 8,
                          child: Stack(
                            children: [
                              Container(color: KlimaColors.trackOnDark),
                              FractionallySizedBox(
                                widthFactor: 36 / 48,
                                child: Container(color: KlimaColors.lime),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: KlimaSpacing.sm),
                    Text(
                      '36/48 slot',
                      style: _ink(KlimaTypography.meta, KlimaColors.surface),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
