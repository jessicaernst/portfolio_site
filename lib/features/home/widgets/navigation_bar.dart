import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class PortfolioNavigationBar extends StatelessWidget {
  const PortfolioNavigationBar({super.key});

  int _alpha(double v) => (v * 255).toInt();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
                _navItem(l10n.home),
                const SizedBox(width: 24),
                _navItem(l10n.portfolio),
                const SizedBox(width: 24),
                _navItem(l10n.languageNav),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
