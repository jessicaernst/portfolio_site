import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/features/home/widgets/section_container.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
          SizedBox(height: AppTheme.spacingMedium),
          _experienceItem(
            title: l10n.mobileAppDeveloper,
            subtitle: l10n.nativeAppDescription,
            company: l10n.micaboCompany,
            period: l10n.period2023,
          ),
          SizedBox(height: AppTheme.spacingMedium),
          _experienceItem(
            title: l10n.mobileAppDeveloperPM,
            subtitle: '',
            company: l10n.startupCompany,
            period: l10n.period2024,
          ),
          SizedBox(height: AppTheme.spacingLarge),
          Center(
            child: Text(
              l10n.downloadCVInfo,
              style: TextStyle(color: AppTheme.textWhite, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          _downloadCVButton(context),
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
      padding: EdgeInsets.all(AppTheme.spacingMedium),
      decoration: BoxDecoration(
        color: AppTheme.textWhite.withAlpha(AppTheme.alpha(0.04)),
        borderRadius: AppTheme.borderRadiusMedium,
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
          LayoutBuilder(
            builder: (context, constraints) {
              // If width is small, stack vertically
              if (constraints.maxWidth < 350) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTheme.sectionTitleStyle.copyWith(
                        color: AppTheme.textWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      period,
                      style: TextStyle(color: AppTheme.white70, fontSize: 13),
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: AppTheme.sectionTitleStyle.copyWith(
                          color: AppTheme.textWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      period,
                      style: TextStyle(color: AppTheme.white70, fontSize: 13),
                    ),
                  ],
                );
              }
            },
          ),
          if (subtitle.isNotEmpty) ...[
            SizedBox(height: AppTheme.spacingSmall),
            Text(
              subtitle,
              style: TextStyle(
                color: AppTheme.textWhite.withAlpha(210),
                fontSize: 14,
              ),
              softWrap: true,
            ),
          ],
          SizedBox(height: AppTheme.spacingSmall),
          Text(
            company,
            style: TextStyle(color: AppTheme.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _downloadCVButton(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: AppTheme.spacingLarge),
        child: ElevatedButton(
          onPressed: () {
            // TODO: Implement download logic
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryOrange,
            padding: EdgeInsets.symmetric(
              horizontal: AppTheme.spacingLarge,
              vertical: AppTheme.spacingMedium - 4,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: AppTheme.borderRadiusLarge,
            ),
            elevation: 4,
          ),
          child: Text(
            l10n.downloadCV,
            style: AppTheme.buttonTextStyle.copyWith(
              color: AppTheme.textWhite,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
