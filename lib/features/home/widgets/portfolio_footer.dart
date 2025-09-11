import 'package:flutter/material.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class PortfolioFooter extends StatelessWidget {
  final bool isDark;
  const PortfolioFooter({super.key, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textColor = isDark ? Colors.white54 : Colors.black54;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          const SizedBox(width: 28),
          Text(l10n.copyrightText, style: TextStyle(color: textColor)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(l10n.imprint, style: TextStyle(color: textColor)),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    l10n.privacyPolicy,
                    style: TextStyle(color: textColor),
                  ),
                ),
                const SizedBox(width: 32),
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
