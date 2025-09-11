import 'package:flutter/material.dart';
import 'package:portfolio_site/features/home/widgets/section_container.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class AboutSection extends StatelessWidget {
  final bool isDark;
  const AboutSection({super.key, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textColor = isDark ? Colors.white.withAlpha(230) : Colors.black;
    return SectionContainer(
      isDark: isDark,
      title: l10n.aboutTitle,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          Text(
            l10n.aboutText1,
            style: TextStyle(color: textColor, fontSize: 15, height: 1.6),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.aboutText2,
            style: TextStyle(color: textColor, fontSize: 15, height: 1.6),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.aboutText3,
            style: TextStyle(color: textColor, fontSize: 15, height: 1.6),
          ),
        ],
      ),
    );
  }
}
