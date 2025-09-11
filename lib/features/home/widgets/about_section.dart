import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/features/home/widgets/section_container.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class AboutSection extends StatelessWidget {
  final bool isDark;
  const AboutSection({super.key, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textColor = isDark
        ? AppTheme.textWhite.withAlpha(230)
        : AppTheme.textBlack;
    return SectionContainer(
      isDark: isDark,
      title: l10n.aboutTitle,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppTheme.spacingSmall - 2),
          Text(
            l10n.aboutText1,
            style: TextStyle(color: textColor, fontSize: 15, height: 1.6),
          ),
          SizedBox(height: AppTheme.spacingMedium - 4),
          Text(
            l10n.aboutText2,
            style: TextStyle(color: textColor, fontSize: 15, height: 1.6),
          ),
          SizedBox(height: AppTheme.spacingMedium - 4),
          Text(
            l10n.aboutText3,
            style: TextStyle(color: textColor, fontSize: 15, height: 1.6),
          ),
        ],
      ),
    );
  }
}
