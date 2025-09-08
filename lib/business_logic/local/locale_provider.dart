import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

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
