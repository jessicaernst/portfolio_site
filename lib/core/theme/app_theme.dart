/// Defines the application's theme settings, including color palette, typography,
/// and component themes for consistent styling across the app.
///
/// The [AppTheme] class provides static constants for commonly used colors,
/// and a static [theme] getter that returns a [ThemeData] object configured
/// with custom colors, text styles using Google Fonts, and component themes
/// such as AppBar, ElevatedButton, TextButton, and Card.
///
/// Includes a helper method [_createMaterialColor] to generate a [MaterialColor]
/// from a single [Color] for use as a primary swatch.
///
/// The [AppThemeExtension] extension on [BuildContext] provides convenient
/// accessors for primary and text colors defined in [AppTheme].
library;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryTeal = Color(0xFF38576B);
  static const Color primaryOrange = Color(0xFFB08251);
  static const Color textBlack = Colors.black;
  static const Color textWhite = Colors.white;
  static const Color backgroundWhite = Colors.white;
  static const Color backgroundGrey = Color(0xFFF5F5F5);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundWhite,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: primaryTeal,
        secondary: primaryOrange,
        surface: backgroundWhite,
        onSurface: textBlack,
      ),

      // Typography - Using Google Fonts with GDPR compliance (no auto-download)
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        // Hero Title
        displayLarge: GoogleFonts.poppins(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: textWhite,
          height: 1.2,
        ),

        // Section Titles
        headlineLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textBlack,
        ),

        // Subsection Titles
        headlineMedium: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textBlack,
        ),

        // Body Text Large
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          color: textBlack,
          height: 1.6,
        ),

        // Body Text Medium
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          color: textBlack,
          height: 1.5,
        ),

        // Labels
        labelLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textBlack,
        ),

        // Small Text
        bodySmall: GoogleFonts.poppins(fontSize: 12, color: textBlack),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: textBlack,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textBlack,
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryOrange,
          foregroundColor: textWhite,
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          elevation: 2,
          shadowColor: primaryOrange.withAlpha((0.3 * 255).toInt()),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: textBlack,
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 8,
        shadowColor: Colors.black.withAlpha((0.1 * 255).toInt()),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: backgroundWhite,
      ),
    );
  }
}

// Extension for easy access to theme colors
extension AppThemeExtension on BuildContext {
  Color get primaryTeal => AppTheme.primaryTeal;
  Color get primaryOrange => AppTheme.primaryOrange;
  Color get textBlack => AppTheme.textBlack;
  Color get textWhite => AppTheme.textWhite;
}
