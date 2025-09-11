import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/features/home/widgets/section_container.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class SkillsSection extends StatelessWidget {
  final bool isDark;
  const SkillsSection({super.key, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final subTitleColor = isDark
        ? AppTheme.textWhite.withAlpha(180)
        : AppTheme.black54;

    return SectionContainer(
      isDark: isDark,
      title: l10n.skillsTitle,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.technicalSkills,
            style: TextStyle(color: subTitleColor, fontSize: 14),
          ),
          SizedBox(height: AppTheme.spacingLarge),
          Wrap(
            spacing: AppTheme.spacingLarge,
            runSpacing: AppTheme.spacingLarge,
            children: [
              _skillBox(context, l10n.uiDevelopment, [
                ['Swift', 4],
                ['SwiftUI', 4],
                ['UI Kit', 3],
                ['Core Data', 3],
              ]),
              _skillBox(context, l10n.mobileDevelopmentCategory, [
                ['Kotlin', 3],
                ['Jetpack Compose', 3],
                ['Android XML View', 3],
                ['Android Room DB', 3],
              ]),
              _skillBox(context, l10n.softwareDevelopment, [
                ['Flutter', 4],
                ['Java', 3],
                ['Git', 4],
                ['Databases', 3],
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _skillBox(
    BuildContext context,
    String category,
    List<List<dynamic>> skills,
  ) {
    final boxColor = isDark
        ? AppTheme.textWhite.withAlpha(AppTheme.alpha(0.04))
        : AppTheme.grey100;
    final borderColor = isDark
        ? AppTheme.textWhite.withAlpha(AppTheme.alpha(0.06))
        : AppTheme.grey300;
    final skillTextColor = isDark
        ? AppTheme.textWhite.withAlpha(230)
        : AppTheme.textBlack;
    final dotFilledColor = isDark ? AppTheme.textWhite : AppTheme.textBlack;
    final dotEmptyColor = isDark
        ? AppTheme.textWhite.withAlpha(AppTheme.alpha(0.18))
        : AppTheme.grey300;

    return Container(
      width: 280,
      padding: EdgeInsets.all(AppTheme.spacingMedium),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: AppTheme.borderRadiusMedium,
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppTheme.spacingMedium - 4,
              vertical: AppTheme.spacingSmall - 2,
            ),
            decoration: BoxDecoration(
              color: context.primaryTeal,
              borderRadius: AppTheme.borderRadiusMedium,
            ),
            child: Text(
              category,
              style: AppTheme.labelStyle.copyWith(
                color: AppTheme.textWhite,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: AppTheme.spacingMedium),
          ...skills.map((skill) {
            return Padding(
              padding: EdgeInsets.only(bottom: AppTheme.spacingSmall + 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    skill[0],
                    style: AppTheme.labelStyle.copyWith(
                      color: skillTextColor,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      return Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(left: 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index < (skill[1] ?? 0)
                              ? dotFilledColor
                              : dotEmptyColor,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
