import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/features/home/widgets/section_container.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  int _alpha(double v) => (v * 255).toInt();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SectionContainer(
      title: l10n.experienceTitle,
      content: Column(
        children: [
          _experienceItem(
            title: l10n.crmDeveloper,
            subtitle: l10n.crmDescription,
            company: l10n.melitaCompany,
            period: l10n.period20182020,
          ),
          const SizedBox(height: 16),
          _experienceItem(
            title: l10n.mobileAppDeveloper,
            subtitle: l10n.nativeAppDescription,
            company: l10n.micaboCompany,
            period: l10n.period2023,
          ),
          const SizedBox(height: 16),
          _experienceItem(
            title: l10n.mobileAppDeveloperPM,
            subtitle: '',
            company: l10n.startupCompany,
            period: l10n.period2024,
          ),
        ],
      ),
    );
  }

  Widget _experienceItem({
    required String title,
    required String subtitle,
    required String company,
    required String period,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(_alpha(0.04)),
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(
            color: AppTheme.primaryOrange.withAlpha(200),
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                period,
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withAlpha(210),
                fontSize: 14,
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(company, style: TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }
}
