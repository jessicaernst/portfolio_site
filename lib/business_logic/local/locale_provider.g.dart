// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
@ProviderFor(LocaleNotifier)
const localeNotifierProvider = LocaleNotifierProvider._();

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
final class LocaleNotifierProvider
    extends $NotifierProvider<LocaleNotifier, Locale> {
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
  const LocaleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeNotifierHash();

  @$internal
  @override
  LocaleNotifier create() => LocaleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$localeNotifierHash() => r'363cc931a61507a70d463678cbefbdfc2a544346';

abstract class _$LocaleNotifier extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
