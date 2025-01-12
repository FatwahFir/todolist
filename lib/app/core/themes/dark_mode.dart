import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode = ThemeData(
  dividerTheme: const DividerThemeData(color: Colors.transparent),
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade600,
    secondary: const Color.fromARGB(255, 78, 78, 78),
    tertiary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade300,
  ),
  useMaterial3: true,
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
    ),
    titleMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
);
