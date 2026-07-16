import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const background = Color(0xFF0B1F17);
  static const surface = Color(0xFF132A22);
  static const card = Color(0xFF1B3A2F);

  // Primary Brand Colors
  static const primary = Color(0xFF2E7D32);
  static const secondary = Color(0xFF66BB6A);

  // Accent
  static const accent = Color(0xFFFFC107);

  // Text
  static const white = Colors.white;
  static const grey = Color(0xFFB0BEC5);

  // Status
  static const red = Color(0xFFE53935);
  static const orange = Color(0xFFFF9800);

  // Extra
  static const success = Color(0xFF43A047);
  static const border = Color(0xFF2C4A3F);

  // Main App Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1B5E20),
      Color(0xFF2E7D32),
      Color(0xFF388E3C),
    ],
  );

  // Background Gradient
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF081C15),
      Color(0xFF0B1F17),
      Color(0xFF132A22),
    ],
  );
}