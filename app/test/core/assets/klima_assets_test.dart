// Memastikan semua aset gambar ada, terdaftar di pubspec, dan berukuran benar
// (Phase 1 langkah 3). Gagal di sini = gambar hilang, salah nama, atau salah resolusi.

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klima/core/assets/klima_assets.dart';
import 'package:klima/core/theme/tokens.dart';

/// Baca lebar, tinggi dan color type dari header PNG (chunk IHDR).
({int width, int height, int colorType}) _pngInfo(Uint8List b) {
  const signature = [137, 80, 78, 71, 13, 10, 26, 10];
  for (var i = 0; i < 8; i++) {
    if (b[i] != signature[i]) throw const FormatException('bukan PNG');
  }
  final d = ByteData.sublistView(b);
  return (width: d.getUint32(16), height: d.getUint32(20), colorType: b[25]);
}

/// Path varian kepadatan: assets/mascots/kepik.png -> assets/mascots/3.0x/kepik.png.
String _variant(String path, String density) {
  final slash = path.lastIndexOf('/');
  return '${path.substring(0, slash)}/$density/${path.substring(slash + 1)}';
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('ada satu mascot untuk tiap spirit', () {
    expect(KlimaAssets.allMascots, hasLength(SpiritPalette.all.length));
    expect(SpiritPalette.kepik.mascot, 'assets/mascots/kepik.png');
  });

  group('mascot', () {
    for (final p in SpiritPalette.all) {
      test('${p.id}: 160 / 320 / 480 px dengan kanal alfa', () {
        const sizes = {'': 160, '2.0x': 320, '3.0x': 480};
        for (final MapEntry(key: density, value: px) in sizes.entries) {
          final path = density.isEmpty ? p.mascot : _variant(p.mascot, density);
          final file = File(path);
          expect(file.existsSync(), isTrue, reason: '$path tidak ada');
          final info = _pngInfo(file.readAsBytesSync());
          expect(info.width, px, reason: path);
          expect(info.height, px, reason: path);
          // 6 = RGBA: latar bisa transparan.
          expect(info.colorType, 6, reason: '$path bukan RGBA');
        }
      });
    }
  });

  test('hero 1000 x 1000', () {
    final info = _pngInfo(File(KlimaAssets.hero).readAsBytesSync());
    expect(info.width, 1000);
    expect(info.height, 1000);
  });

  test('semua aset terdaftar di pubspec (bisa dimuat dari bundle)', () async {
    for (final path in [...KlimaAssets.allMascots, KlimaAssets.hero]) {
      final data = await rootBundle.load(path);
      expect(data.lengthInBytes, greaterThan(0), reason: path);
    }
  });
}
