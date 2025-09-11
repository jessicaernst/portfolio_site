import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/features/home/widgets/section_container.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDark;
  const ProjectsSection({super.key, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final containerColor = isDark
        ? AppTheme.textWhite.withAlpha(AppTheme.alpha(0.04))
        : AppTheme.grey100;
    final borderColor = isDark
        ? AppTheme.textWhite.withAlpha(AppTheme.alpha(0.06))
        : AppTheme.grey300;
    final titleColor = isDark ? AppTheme.textWhite : AppTheme.textBlack;
    final subtitleColor = isDark
        ? AppTheme.textWhite.withAlpha(200)
        : AppTheme.black87;
    final techColor = isDark ? AppTheme.white70 : AppTheme.black54;
    final buttonBgColor = isDark
        ? AppTheme.textWhite.withAlpha(AppTheme.alpha(0.06))
        : AppTheme.grey200;
    final buttonTextColor = isDark ? AppTheme.textWhite : AppTheme.textBlack;

    return SectionContainer(
      isDark: isDark,
      title: l10n.currentProjects,
      content: Container(
        padding: EdgeInsets.all(AppTheme.spacingLarge - 4),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: AppTheme.borderRadiusMedium,
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMedium,
                vertical: AppTheme.spacingSmall,
              ),
              decoration: BoxDecoration(
                color: context.primaryTeal,
                borderRadius: AppTheme.borderRadiusMedium,
              ),
              child: Text(
                'BRAINBENCH',
                style: AppTheme.labelStyle.copyWith(
                  color: context.textWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: AppTheme.spacingMedium),
            Text(
              l10n.brainbenchTitle,
              style: AppTheme.sectionTitleStyle.copyWith(
                color: titleColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppTheme.spacingSmall),
            Text(
              l10n.brainbenchDescription,
              style: TextStyle(color: subtitleColor, fontSize: 15, height: 1.5),
            ),
            SizedBox(height: AppTheme.spacingMedium),
            Text(l10n.brainbenchTech, style: TextStyle(color: techColor)),
            SizedBox(height: AppTheme.spacingMedium),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: buttonBgColor,
                padding: EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingLarge,
                  vertical: AppTheme.spacingMedium - 4,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: AppTheme.borderRadiusLarge,
                ),
              ),
              child: Text(
                l10n.moreArrow,
                style: AppTheme.buttonTextStyle.copyWith(
                  color: buttonTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
