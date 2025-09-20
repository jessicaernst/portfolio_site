import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

/// A [Riverpod] notifier that manages the application's locale state.
///
/// This notifier determines the initial locale based on the system's locale,
/// defaulting to German (`'de'`) if the system locale is not supported.
/// It provides methods to set the locale, toggle between German and English,
/// and retrieve information about the current language.
///
/// - [build]: Initializes the locale based on the system's locale, with a fallback to German.
/// - [setLocale]: Updates the locale to a new value.
/// - [toggleLanguage]: Switches the locale between German and English.
/// - [isGerman]: Returns `true` if the current locale is German.
/// - [isEnglish]: Returns `true` if the current locale is English.
/// - [currentLanguageCode]: Returns the current language code as a string.
/// - [currentLanguageName]: Returns the display name of the current language.

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() {
    // Default to system locale or German as fallback
    final systemLocale = ui.PlatformDispatcher.instance.locale;

    // Check if system locale is supported
    if (systemLocale.languageCode == 'en' ||
        systemLocale.languageCode == 'de') {
      return systemLocale;
    }

    // Fallback to German
    return const Locale('de');
  }

  void setLocale(Locale newLocale) {
    state = newLocale;
  }

  void toggleLanguage() {
    if (state.languageCode == 'de') {
      state = const Locale('en');
    } else {
      state = const Locale('de');
    }
  }

  bool get isGerman => state.languageCode == 'de';
  bool get isEnglish => state.languageCode == 'en';

  String get currentLanguageCode => state.languageCode;
  String get currentLanguageName => isGerman ? 'Deutsch' : 'English';
}
