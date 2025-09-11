import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/features/home/widgets/section_container.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDark;
  const ProjectsSection({super.key, this.isDark = true});

  int _alpha(double v) => (v * 255).toInt();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final containerColor = isDark
        ? Colors.white.withAlpha(_alpha(0.04))
        : Colors.grey.shade100;
    final borderColor = isDark
        ? Colors.white.withAlpha(_alpha(0.06))
        : Colors.grey.shade300;
    final titleColor = isDark ? Colors.white : Colors.black;
    final subtitleColor = isDark ? Colors.white.withAlpha(200) : Colors.black87;
    final techColor = isDark ? Colors.white70 : Colors.black54;
    final buttonBgColor = isDark
        ? Colors.white.withAlpha(_alpha(0.06))
        : Colors.grey.shade200;
    final buttonTextColor = isDark ? Colors.white : Colors.black;

    return SectionContainer(
      isDark: isDark,
      title: l10n.currentProjects,
      content: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: context.primaryTeal,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'BRAINBENCH',
                style: TextStyle(
                  color: context.textWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.brainbenchTitle,
              style: TextStyle(
                color: titleColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.brainbenchDescription,
              style: TextStyle(color: subtitleColor, fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 12),
            Text(l10n.brainbenchTech, style: TextStyle(color: techColor)),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: buttonBgColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                l10n.moreArrow,
                style: TextStyle(color: buttonTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
