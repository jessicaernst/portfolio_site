import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final Widget content;
  final bool isDark;

  const SectionContainer({
    super.key,
    required this.title,
    required this.content,
    this.isDark = true,
  });

  @override
  Widget build(BuildContext context) {
    final contentWidget = Container(
      padding: EdgeInsets.all(AppTheme.paddingSection),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withAlpha(AppTheme.alpha(0.06))
            : Colors.white.withAlpha(AppTheme.alpha(0.8)),
        borderRadius: AppTheme.borderRadiusLarge,
        border: isDark
            ? Border.all(
                color: AppTheme.textWhite.withAlpha(AppTheme.alpha(0.08)),
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.sectionTitleStyle.copyWith(
              color: isDark ? AppTheme.textWhite : AppTheme.textBlack,
            ),
          ),
          SizedBox(height: AppTheme.spacingMedium),
          content,
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppTheme.paddingPage,
        vertical: AppTheme.paddingPage,
      ),
      child: ClipRRect(
        borderRadius: AppTheme.borderRadiusLarge,
        child: isDark
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: contentWidget,
              )
            : contentWidget,
      ),
    );
  }
}
