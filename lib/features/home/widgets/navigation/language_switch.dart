import 'package:flutter/material.dart';
import 'package:portfolio_site/business_logic/local/locale_provider.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';

/// A widget that displays a language switch button, allowing users to toggle between locales.
///
/// Displays an icon and optionally the current language code. Shows a loading indicator when toggling.
///
/// - [currentLocale]: The currently selected locale.
/// - [localeNotifier]: The notifier used to update the locale.
/// - [iconOnly]: If true, only the language icon is shown.
/// - [isToggling]: If true, disables the button and shows a loading indicator.
/// - [showArrow]: If true, shows the language code next to the icon.
/// - [onToggle]: Callback invoked when the button is pressed to toggle the language.
class LanguageSwitch extends StatelessWidget {
  final Locale currentLocale;
  final LocaleNotifier localeNotifier;
  final bool iconOnly;
  final bool isToggling;
  final bool showArrow;
  final VoidCallback onToggle;

  const LanguageSwitch({
    super.key,
    required this.currentLocale,
    required this.localeNotifier,
    required this.iconOnly,
    required this.isToggling,
    required this.showArrow,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final showLanguageCode = !iconOnly || showArrow;
    return TextButton(
      onPressed: isToggling ? null : onToggle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.language,
            color: isToggling
                ? AppTheme.textWhite.withAlpha(AppTheme.alpha(0.4))
                : AppTheme.textWhite.withAlpha(AppTheme.alpha(0.8)),
            size: 22,
          ),
          if (showLanguageCode) ...[
            SizedBox(width: AppTheme.spacingSmall - 4),
            isToggling
                ? SizedBox(
                    width: AppTheme.spacingMedium,
                    height: AppTheme.spacingMedium,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppTheme.textWhite.withAlpha(AppTheme.alpha(0.8)),
                      ),
                    ),
                  )
                : Text(
                    currentLocale.languageCode.toUpperCase(),
                    style: AppTheme.labelStyle.copyWith(
                      color: AppTheme.textWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ],
        ],
      ),
    );
  }
}
