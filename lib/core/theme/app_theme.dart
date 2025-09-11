/// Defines the application's theme settings, including color palette, typography,
/// and component themes for consistent styling across the app.
///
/// The [AppTheme] class provides static constants for commonly used colors,
/// and a static [theme] getter that returns a [ThemeData] object configured
/// with custom colors, text styles, and component themes such as AppBar, ElevatedButton, TextButton, and Card.
///
/// Includes a helper method [_createMaterialColor] to generate a [MaterialColor]
/// from a single [Color] for use as a primary swatch.
///
/// The [AppThemeExtension] extension on [BuildContext] provides convenient
/// accessors for primary and text colors defined in [AppTheme].
library;

import 'package:flutter/material.dart';

class AppTheme {
  // BorderRadius
  static const double radiusSmall = 8;
  static const double radiusMedium = 12;
  static const double radiusLarge = 16;
  static const double radiusXLarge = 25;
  static const double radiusXXLarge = 999;

  static BorderRadius get borderRadiusSmall =>
      BorderRadius.circular(radiusSmall);
  static BorderRadius get borderRadiusMedium =>
      BorderRadius.circular(radiusMedium);
  static BorderRadius get borderRadiusLarge =>
      BorderRadius.circular(radiusLarge);
  static BorderRadius get borderRadiusXLarge =>
      BorderRadius.circular(radiusXLarge);
  static BorderRadius get borderRadiusXXLarge =>
      BorderRadius.circular(radiusXXLarge);

  // Padding & Spacing
  static const double paddingPage = 28;
  static const double paddingSection = 24;
  static const double paddingButton = 16;
  static const double spacingSmall = 8;
  static const double spacingMedium = 16;
  static const double spacingLarge = 24;
  static const double spacingXLarge = 32;

  // Weitere Farben
  static Color get white70 => Colors.white70;
  static Color get white54 => Colors.white54;
  static Color get black54 => Colors.black54;
  static Color get black87 => Colors.black87;
  static Color get lightBlue100 => Colors.lightBlue[100]!;
  static Color get grey100 => Colors.grey.shade100;
  static Color get grey200 => Colors.grey.shade200;
  static Color get grey300 => Colors.grey.shade300;

  // TextStyles
  static TextStyle get sectionTitleStyle => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: textBlack,
  );

  static TextStyle get buttonTextStyle => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: textWhite,
  );

  static TextStyle get labelStyle => const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textBlack,
  );

  /// Converts a double value [v] representing an alpha (opacity) value in the range [0.0, 1.0]
  /// to an integer in the range [0, 255] suitable for use as an ARGB alpha channel.
  ///
  /// If [v] is NaN or infinite, returns 0.
  /// Otherwise, clamps [v] between 0.0 and 1.0, multiplies by 255, and returns the result as an integer.
  static int alpha(double v) {
    if (v.isNaN || v.isInfinite) {
      return 0;
    }
    return ((v.clamp(0.0, 1.0)) * 255).round();
  }

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

      // Color scheme
      colorScheme: const ColorScheme.light(
        primary: primaryTeal,
        secondary: primaryOrange,
        surface: backgroundWhite,
        onSurface: textBlack,
      ),

      // Use bundled Poppins font from assets for all text styles
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: textWhite,
          height: 1.2,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textBlack,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textBlack,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: textBlack,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: textBlack,
          height: 1.5,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textBlack,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          color: textBlack,
        ),
      ),

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: textBlack,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textBlack,
        ),
      ),

      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(primaryOrange),
          foregroundColor: WidgetStatePropertyAll(textWhite),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          elevation: WidgetStatePropertyAll(2),
          shadowColor: WidgetStatePropertyAll(
            primaryOrange.withAlpha(AppTheme.alpha(0.3)),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(textBlack),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),

      // Card theme
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
