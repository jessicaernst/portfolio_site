import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_site/business_logic/local/locale_provider.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class PortfolioNavigationBar extends ConsumerStatefulWidget {
  const PortfolioNavigationBar({super.key});

  @override
  ConsumerState<PortfolioNavigationBar> createState() =>
      _PortfolioNavigationBarState();
}

enum NavigationItem { home, portfolio }

class _PortfolioNavigationBarState
    extends ConsumerState<PortfolioNavigationBar> {
  bool _isToggling = false;
  NavigationItem _activeItem = NavigationItem.home; // Default to home

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final localeNotifier = ref.read(localeNotifierProvider.notifier);
    final currentLocale = ref.watch(localeNotifierProvider);

    return Container(
      height: 72,
      padding: EdgeInsets.symmetric(horizontal: AppTheme.paddingPage),
      alignment: Alignment.centerRight,
      child: ClipRRect(
        borderRadius: AppTheme.borderRadiusLarge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppTheme.spacingLarge - 6,
            ),
            color: AppTheme.textWhite.withAlpha(AppTheme.alpha(0.04)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _navItem(
                  l10n.home,
                  NavigationItem.home,
                  () => setState(() => _activeItem = NavigationItem.home),
                ),
                SizedBox(width: AppTheme.spacingLarge),
                _navItem(
                  l10n.portfolio,
                  NavigationItem.portfolio,
                  () => setState(() => _activeItem = NavigationItem.portfolio),
                ),
                SizedBox(width: AppTheme.spacingLarge),
                _languageSwitch(currentLocale, localeNotifier),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(String text, NavigationItem item, VoidCallback? onPressed) {
    final isActive = _activeItem == item;

    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadiusSmall,
        color: isActive
            ? AppTheme.lightBlue100.withAlpha(AppTheme.alpha(0.2))
            : Colors.transparent,
        border: isActive
            ? Border.all(
                color: AppTheme.lightBlue100.withAlpha(AppTheme.alpha(0.4)),
                width: 1,
              )
            : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMedium,
            vertical: AppTheme.spacingSmall,
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: AppTheme.labelStyle.copyWith(
            color: isActive ? AppTheme.lightBlue100 : AppTheme.textWhite,
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
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
              width: AppTheme.spacingMedium,
              height: AppTheme.spacingMedium,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.textWhite.withAlpha(AppTheme.alpha(0.8)),
                ),
              ),
            )
          else
            Text(
              currentLocale.languageCode.toUpperCase(),
              style: AppTheme.labelStyle.copyWith(
                color: AppTheme.textWhite,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          SizedBox(width: AppTheme.spacingSmall - 4),
          Icon(
            Icons.language,
            color: _isToggling
                ? AppTheme.textWhite.withAlpha(AppTheme.alpha(0.4))
                : AppTheme.textWhite.withAlpha(AppTheme.alpha(0.8)),
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
