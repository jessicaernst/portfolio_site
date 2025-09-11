import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/features/home/widgets/section_container.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  int _alpha(double v) => (v * 255).toInt();

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Berufserfahrung',
      content: Column(
        children: [
          _experienceItem(
            title: 'CRM-Entwicklerin',
            subtitle: 'Entwicklung von Dynamics 365 Plugins in C#',
            company: 'MELITA PORTAL SERVICES GmbH, BREMEN',
            period: '2018 - 2020',
          ),
          const SizedBox(height: 16),
          _experienceItem(
            title: 'Mobile App Entwicklerin',
            subtitle: 'Native App-Entwicklung für Android und iOS',
            company: 'MICABO GMBH SOLUTIONS GmbH, ESSEN, REMOTE',
            period: '2023',
          ),
          const SizedBox(height: 16),
          _experienceItem(
            title: 'Mobile App Entwicklerin & Projektmanagement',
            subtitle: '',
            company: 'Start-up, Flutter, Design, Projektmanagement',
            period: '2024',
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
