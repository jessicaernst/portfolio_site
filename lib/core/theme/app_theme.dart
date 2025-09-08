import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Palette - Ihre exakten Farben
  static const Color primaryTeal = Color(0xFF38576B); // Petrol/Teal
  static const Color primaryOrange = Color(0xFFB08251); // Button Farbe
  static const Color textBlack = Colors.black;
  static const Color textWhite = Colors.white;
  static const Color backgroundWhite = Colors.white;
  static const Color backgroundGrey = Color(0xFFF5F5F5);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: _createMaterialColor(primaryTeal),
      primaryColor: primaryTeal,
      scaffoldBackgroundColor: backgroundWhite,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: primaryTeal,
        secondary: primaryOrange,
        surface: backgroundWhite,
        onSurface: textBlack,
      ),

      // Typography
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
          shadowColor: primaryOrange.withOpacity(0.3),
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

  // Helper um MaterialColor aus Color zu erstellen
  static MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

// Extension für einfache Farbzugriffe
extension AppThemeExtension on BuildContext {
  Color get primaryTeal => AppTheme.primaryTeal;
  Color get primaryOrange => AppTheme.primaryOrange;
  Color get textBlack => AppTheme.textBlack;
  Color get textWhite => AppTheme.textWhite;
}
