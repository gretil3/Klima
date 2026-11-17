// Spasi dan ukuran tata letak Klima. Sumber: Figma section 42:307 "Layout" (frame 42:310).

/// Skala spasi (px logis). Sumber: kotak 42:313.
abstract final class KlimaSpacing {
  /// 8. Node "Space 8" 42:314.
  static const double xs = 8;

  /// 12. Node "Space 12" 42:316.
  static const double sm = 12;

  /// 16. Node "Space 16" 42:318.
  static const double md = 16;

  /// 20. Node "Space 20" 42:320.
  static const double lg = 20;

  /// 24. Node "Space 24" 42:322.
  static const double xl = 24;
}

/// Ukuran bingkai layar dan komponen. Sumber: kotak "Frame" 42:347.
abstract final class KlimaLayout {
  /// Ukuran frame desain (iPhone 390x844). Node 42:346.
  static const double frameWidth = 390;
  static const double frameHeight = 844;

  /// "Side margin 16", node 42:348.
  static const double sideMargin = 16;

  /// "Content top 57", node 42:349.
  static const double contentTop = 57;

  /// "Buttons 30 from bottom", node 42:350.
  static const double buttonsFromBottom = 30;

  /// "Touch target >= 44", node 42:351.
  static const double minTouchTarget = 44;

  /// "Button 56 · row 84 · chip 44", node 42:352.
  static const double buttonHeight = 56;
  static const double rowHeight = 84;
  static const double chipHeight = 44;
}
