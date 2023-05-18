import 'package:flutter/material.dart';

// Color Constants
class ColorConstants {
  static const Color primary = Color(0xFF10D7EE);
  static const Color background = Color(0xFFEFF7FE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color bodyText = Color(0xFF545E65);
}

//TextStyles
class AppTextStyle {
  static const TextStyle h1 = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.4,
      fontFamily: 'Monteserrat');

  static const TextStyle para1B = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'Monteserrat');

  static const TextStyle label = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.4,
      fontFamily: 'Monteserrat');
}
