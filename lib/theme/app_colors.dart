// lib/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primary = Color(0xFF8B0000); // Deep Red/Maroon
  static const Color accent = Color(0xFFFFA500); // Vibrant Orange/Saffron

  // Backgrounds and Surfaces
  static const Color background = Color(0xFFF5F5F5); // Light Grey background
  static const Color cardBackground = Color(0xFFFFFFFF); // White for cards

  // Text Colors
  static const Color textDark = Color(0xFF212121); // Dark grey for text
  static const Color textLight = Color(0xFFFFFFFF); // White for text on dark backgrounds
  static const Color grey = Color(0xFF9E9E9E); // General grey for text/icons
  static const Color darkGrey = Color(0xFF424242);
  static const Color lightGrey = Color(0xFFE0E0E0);

  static const Color backgroundLight = Color(0xFFF8F8F8); // Very light grey, clean
  static const Color cardBackgroundLight = Color(0xFFFFFFFF); 
  // Semantic Colors
  static const Color errorRed = Color(0xFFD32F2F); // Red for errors
  static const Color green = Color(0xFF4CAF50); // Green for success/WhatsApp
  static const Color blue = Color(0xFF2196F3); // Blue for links/info
  static const Color yellow = Color(0xFFFFEB3B); // Yellow for warnings/highlights
  static const Color red = Color(0xFFF44336); // General red (distinct from errorRed if needed)

  // Specific Colors
  static const Color starYellow = Color(0xFFFFC107); // Yellow for ratings stars
  static const Color shadowColor = Colors.black; // Standard black for shadows
}