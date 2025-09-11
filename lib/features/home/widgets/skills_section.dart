import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/features/home/widgets/section_container.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class SkillsSection extends StatelessWidget {
  final bool isDark;
  const SkillsSection({super.key, this.isDark = true});

  int _alpha(double v) => (v * 255).toInt();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final subTitleColor = isDark ? Colors.white.withAlpha(180) : Colors.black54;

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
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
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
        ? Colors.white.withAlpha(_alpha(0.04))
        : Colors.grey.shade100;
    final borderColor = isDark
        ? Colors.white.withAlpha(_alpha(0.06))
        : Colors.grey.shade300;
    final skillTextColor = isDark ? Colors.white.withAlpha(230) : Colors.black;
    final dotFilledColor = isDark ? Colors.white : Colors.black;
    final dotEmptyColor = isDark
        ? Colors.white.withAlpha(_alpha(0.18))
        : Colors.grey.shade300;

    return Container(
      width: 280,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: context.primaryTeal,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...skills.map((skill) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    skill[0],
                    style: TextStyle(color: skillTextColor, fontSize: 14),
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
