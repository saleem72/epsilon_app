//

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryLight = Color(0xFF4F7694);
  static const Color primaryDark = Color(0xFF226184);
  static const Color neutral = Color(0XFFF1F1F1);
  static const Color textLight = Colors.white;
  static const Color textDark = Colors.black;
  static const Color secondary = Color(0xFFAEAAAE);

  static const Color gradientStart = Color(0xFF0083AB);
  static const Color gradientEnd = Color(0xFF27587E);

  static const gradient = LinearGradient(
    begin: Alignment(-1.4534885883331299, -8.366897485260393e-17),
    end: Alignment(1.006429672241211, -0.37631702423095703),
    colors: [
      gradientStart,
      gradientEnd,
    ],
  );
}
