import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFFF5A5A);
  static const primaryLight = Color(0xFFFF8F8F);
  static const dark = Color(0xFF4A4A4A);
  static const grey = Color(0xFF9E9E9E);
  static const field = Color(0xFFEEF2F5);
  static const border = Color(0xFFE6E6E6);

  static const gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryLight, primary],
  );
}