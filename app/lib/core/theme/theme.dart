// Satu pintu impor untuk UI: token + ThemeData Klima.
//   import 'package:klima/core/theme/theme.dart';
//
// tokens.dart sengaja tetap terpisah dan hanya bergantung pada
// package:flutter/painting.dart (tanpa Material), supaya kode non-UI dan tes token
// tetap ringan. File ini menambah klima_theme.dart yang butuh material_ui.

export 'klima_theme.dart';
export 'tokens.dart';
