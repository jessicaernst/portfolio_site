import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';

/// A custom navigation arrow button widget.
///
/// Displays either a left or right arrow icon based on the [left] parameter.
/// The button is wrapped in a transparent [Material] and uses [InkWell] for tap effects.
///
/// - [left]: If true, shows a left arrow; otherwise, shows a right arrow.
/// - [onTap]: Callback triggered when the button is tapped.
class NavArrowButton extends StatelessWidget {
  final bool left;
  final VoidCallback onTap;

  const NavArrowButton({super.key, required this.left, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          width: 36,
          height: 48,
          alignment: Alignment.center,
          child: Icon(
            left
                ? Icons.arrow_back_ios_new_rounded
                : Icons.arrow_forward_ios_rounded,
            color: AppTheme.textWhite.withAlpha(AppTheme.alpha(0.7)),
            size: 22,
          ),
        ),
      ),
    );
  }
}
