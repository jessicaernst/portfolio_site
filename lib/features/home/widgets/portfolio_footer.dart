import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class PortfolioFooter extends StatelessWidget {
  final bool isDark;
  const PortfolioFooter({super.key, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textColor = isDark ? AppTheme.white54 : AppTheme.black54;

    return Container(
      padding: EdgeInsets.symmetric(vertical: AppTheme.spacingLarge),
      child: Row(
        children: [
          SizedBox(width: AppTheme.paddingPage),
          Text(l10n.copyrightText, style: TextStyle(color: textColor)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(l10n.imprint, style: TextStyle(color: textColor)),
                ),
                SizedBox(width: AppTheme.spacingXLarge),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    l10n.privacyPolicy,
                    style: TextStyle(color: textColor),
                  ),
                ),
                SizedBox(width: AppTheme.spacingXLarge),
                TextButton(
                  onPressed: () {},
                  child: Text(l10n.contact, style: TextStyle(color: textColor)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
