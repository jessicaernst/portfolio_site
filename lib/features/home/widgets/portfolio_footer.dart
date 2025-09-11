import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class PortfolioFooter extends StatelessWidget {
  final bool isDark;
  const PortfolioFooter({super.key, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textColor = isDark ? AppTheme.white54 : AppTheme.black54;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 500;
        return Container(
          padding: EdgeInsets.symmetric(vertical: AppTheme.spacingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isNarrow
                  ? Wrap(
                      alignment: WrapAlignment.center,
                      spacing: AppTheme.spacingMedium,
                      runSpacing: AppTheme.spacingSmall,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            l10n.imprint,
                            style: TextStyle(color: textColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            l10n.privacyPolicy,
                            style: TextStyle(color: textColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            l10n.contact,
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        SizedBox(width: AppTheme.paddingPage),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  l10n.imprint,
                                  style: TextStyle(color: textColor),
                                ),
                              ),
                              SizedBox(width: AppTheme.spacingXLarge),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  l10n.privacyPolicy,
                                  style: TextStyle(color: textColor),
                                ),
                              ),
                              SizedBox(width: AppTheme.spacingXLarge),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  l10n.contact,
                                  style: TextStyle(color: textColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: AppTheme.paddingPage),
              Center(
                child: Text(
                  l10n.copyrightText,
                  style: TextStyle(color: textColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
