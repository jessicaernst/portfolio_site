import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_site/business_logic/local/locale_provider.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class PortfolioNavigationBar extends ConsumerStatefulWidget {
  const PortfolioNavigationBar({super.key});

  @override
  ConsumerState<PortfolioNavigationBar> createState() => _PortfolioNavigationBarState();
}

class _PortfolioNavigationBarState extends ConsumerState<PortfolioNavigationBar> {
  bool _isToggling = false;

  int _alpha(double v) => (v * 255).toInt();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final localeNotifier = ref.read(localeNotifierProvider.notifier);
    final currentLocale = ref.watch(localeNotifierProvider);

    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      alignment: Alignment.centerRight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            color: Colors.white.withAlpha(_alpha(0.04)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _navItem(l10n.home, null),
                const SizedBox(width: 24),
                _navItem(l10n.portfolio, null),
                const SizedBox(width: 24),
                _languageSwitch(currentLocale, localeNotifier),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(String text, VoidCallback? onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _languageSwitch(Locale currentLocale, LocaleNotifier localeNotifier) {
    return TextButton(
      onPressed: _isToggling 
        ? null 
        : () => _handleLanguageToggle(localeNotifier),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isToggling)
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white.withAlpha((0.8 * 255).toInt()),
                ),
              ),
            )
          else
            Text(
              currentLocale.languageCode.toUpperCase(),
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          const SizedBox(width: 4),
          Icon(
            Icons.language,
            color: _isToggling 
              ? Colors.white.withAlpha((0.4 * 255).toInt())
              : Colors.white.withAlpha((0.8 * 255).toInt()),
            size: 18,
          ),
        ],
      ),
    );
  }

  Future<void> _handleLanguageToggle(LocaleNotifier localeNotifier) async {
    if (_isToggling) return;

    setState(() {
      _isToggling = true;
    });

    // Toggle the language
    localeNotifier.toggleLanguage();

    // Brief delay to allow UI to update and prevent rapid toggling
    await Future.delayed(const Duration(milliseconds: 600));

    if (mounted) {
      setState(() {
        _isToggling = false;
      });
    }
  }
}
