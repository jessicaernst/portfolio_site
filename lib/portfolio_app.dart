import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_site/business_logic/local/locale_provider.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/features/home/home_page.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeNotifierProvider);

    return MaterialApp(
      title: 'Jessica Ernst - Portfolio',
      debugShowCheckedModeBanner: false,

      // Theme Configuration
      theme: AppTheme.theme,

      // Localization Configuration
      locale: currentLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('de')],

      // Home Page
      home: const PortfolioScreen(),
    );
  }
}
