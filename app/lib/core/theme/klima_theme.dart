// ThemeData Klima: menerjemahkan token (klima_colors, klima_typography) ke "bahasa"
// Material supaya widget bawaan (Text, Scaffold, TextField, ...) otomatis ikut gaya Klima.
// Token tetap sumber nilai; file ini hanya MEMETAKAN token ke slot Material, tanpa nilai baru,
// kecuali [KlimaTheme._error] (Figma belum punya warna galat, lihat komentarnya).

import 'package:material_ui/material_ui.dart';

import 'klima_colors.dart';
import 'klima_typography.dart';

abstract final class KlimaTheme {
  /// Warna galat SEMENTARA = merah bawaan Material 3 (ColorScheme.light).
  /// Figma Klima belum punya warna galat/state error; JANGAN dipakai untuk desain
  /// sampai tim memutuskan token resminya.
  static const Color _error = Color(0xFFBA1A1A);

  /// Tema terang Klima. [spirit] = spirit aktif pengguna (default Kepik), dibaca
  /// widget lewat [KlimaSpiritTheme.of].
  static ThemeData light({SpiritPalette spirit = SpiritPalette.kepik}) {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      // Hijau Klima = tinta merek. Material memakai primary untuk banyak hal kecil
      // (kursor, garis fokus, progress, switch); semuanya cocok berwarna tinta.
      primary: KlimaColors.forest,
      onPrimary: KlimaColors.surface,
      // Oranye = CTA (Primary button, "Segera"); dipakai hemat, jadi secondary.
      secondary: KlimaColors.orange,
      onSecondary: KlimaColors.inkOnOrange,
      // Lime = sorotan dan tile.
      tertiary: KlimaColors.lime,
      onTertiary: KlimaColors.forest,
      error: _error,
      onError: KlimaColors.surface,
      // Kartu putih di atas latar mint.
      surface: KlimaColors.surface,
      onSurface: KlimaColors.forest,
      onSurfaceVariant: KlimaColors.greenSoft,
      // Garis 2px dan bayangan keras Klima berwarna forest.
      outline: KlimaColors.forest,
      outlineVariant: KlimaColors.mintShard2,
      shadow: KlimaColors.forest,
      // Matikan "tint" elevasi Material 3: Klima memakai bayangan keras, bukan warna.
      surfaceTint: Color(0x00000000),
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: KlimaColors.mintGround,
      fontFamily: KlimaTypography.fontFamily,
      textTheme: _textTheme,
      extensions: [KlimaSpiritTheme(palette: spirit)],
    );
  }

  /// 7 gaya Klima dipetakan ke 15 slot Material (berdasarkan ukuran terdekat dan peran).
  /// [KlimaTypography.captionCaps] tidak punya slot; widget memakainya langsung.
  static final TextTheme _textTheme = TextTheme(
    displayLarge: _s(KlimaTypography.display),
    displayMedium: _s(KlimaTypography.display),
    displaySmall: _s(KlimaTypography.display),
    headlineLarge: _s(KlimaTypography.title),
    headlineMedium: _s(KlimaTypography.title),
    headlineSmall: _s(KlimaTypography.header),
    titleLarge: _s(KlimaTypography.header), // judul AppBar
    titleMedium: _s(KlimaTypography.section),
    titleSmall: _s(KlimaTypography.body),
    bodyLarge: _s(KlimaTypography.body), // isian TextField, judul ListTile
    bodyMedium: _s(KlimaTypography.body), // gaya default widget Text
    bodySmall: _s(KlimaTypography.meta),
    labelLarge: _s(KlimaTypography.section), // label tombol bawaan
    labelMedium: _s(KlimaTypography.meta),
    labelSmall: _s(KlimaTypography.caption),
  );

  /// ThemeData MENGGABUNGKAN textTheme kita dengan bawaan Material: properti yang
  /// null diisi Material (mis. letterSpacing 0.25 di bodyMedium). Gaya Klima tanpa
  /// letterSpacing berarti 0, jadi ditulis eksplisit di sini. Token tidak diubah.
  static TextStyle _s(TextStyle token) =>
      token.copyWith(letterSpacing: token.letterSpacing ?? 0);
}

/// Spirit aktif pengguna sebagai bagian dari tema, supaya widget mana pun bisa
/// membaca warna spirit tanpa dioper lewat konstruktor:
///   final spirit = KlimaSpiritTheme.of(context).palette;
@immutable
final class KlimaSpiritTheme extends ThemeExtension<KlimaSpiritTheme> {
  const KlimaSpiritTheme({this.palette = SpiritPalette.kepik});

  final SpiritPalette palette;

  /// Ekstensi dari tema terdekat; jika tema tidak memasangnya, kembali ke Kepik.
  static KlimaSpiritTheme of(BuildContext context) =>
      Theme.of(context).extension<KlimaSpiritTheme>() ??
      const KlimaSpiritTheme();

  @override
  KlimaSpiritTheme copyWith({SpiritPalette? palette}) =>
      KlimaSpiritTheme(palette: palette ?? this.palette);

  /// Dipanggil saat tema beranimasi (mis. pengguna ganti spirit): warna dicampur
  /// halus, id dan nama pindah di tengah animasi.
  @override
  KlimaSpiritTheme lerp(KlimaSpiritTheme? other, double t) {
    if (other == null) return this;
    final a = palette;
    final b = other.palette;
    final named = t < 0.5 ? a : b;
    return KlimaSpiritTheme(
      palette: SpiritPalette(
        id: named.id,
        displayName: named.displayName,
        ground: Color.lerp(a.ground, b.ground, t)!,
        platform: Color.lerp(a.platform, b.platform, t)!,
        side: Color.lerp(a.side, b.side, t)!,
        ink: Color.lerp(a.ink, b.ink, t)!,
      ),
    );
  }
}
