import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/gen/assets.gen.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    final l10n = AppLocalizations.of(context);

    // Determine current locale
    final isGerman = Localizations.localeOf(context).languageCode == 'de';

    // Select language and screen size specific header text image
    final AssetGenImage headerTextImage;
    if (screenWidth < 650) {
      headerTextImage = isGerman
          ? Assets.images.headerTextMobileDe
          : Assets.images.headerTextMobileEn;
    } else if (screenWidth < 1100) {
      headerTextImage = isGerman
          ? Assets.images.headerTextTabletDe
          : Assets.images.headerTextTabletEn;
    } else {
      headerTextImage = isGerman
          ? Assets.images.headerTextDesktopDe
          : Assets.images.headerTextDesktopEn;
    }

    final AssetGenImage profileImage;
    if (screenWidth < 650) {
      profileImage = Assets.images.profileImageMobile;
    } else if (screenWidth < 1100) {
      profileImage = Assets.images.profileImageTablet;
    } else {
      profileImage = Assets.images.profileImageDesktop;
    }
    final isNarrow = screenWidth < 900;

    final imageWidth = (screenWidth * 0.3).clamp(260.0, 400.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        final heroPadding = EdgeInsets.symmetric(
          vertical: isNarrow
              ? AppTheme.spacingXLarge * 2
              : AppTheme.spacingXLarge * 3,
          horizontal: isNarrow
              ? AppTheme.spacingLarge
              : AppTheme.spacingXLarge * 1.5,
        );

        final profileImageWidget = Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: imageWidth),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                isNarrow ? AppTheme.radiusXLarge : AppTheme.radiusLarge,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.textWhite.withAlpha(AppTheme.alpha(0.06)),
                    borderRadius: BorderRadius.circular(
                      isNarrow ? AppTheme.radiusXLarge : AppTheme.radiusLarge,
                    ),
                    border: Border.all(
                      color: AppTheme.textWhite.withAlpha(AppTheme.alpha(0.08)),
                    ),
                  ),
                  child: profileImage.image(fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        );

        return Padding(
          padding: heroPadding,
          child: Flex(
            direction: isNarrow ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: isNarrow ? 0 : 1,
                child: Column(
                  crossAxisAlignment: isNarrow
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: headerTextImage.image(),
                    ),
                    if (isNarrow) SizedBox(height: AppTheme.spacingLarge),
                    if (isNarrow) profileImageWidget,
                    SizedBox(height: AppTheme.spacingLarge),
                    Row(
                      mainAxisAlignment: isNarrow
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        _socialIcon('in'),
                        SizedBox(width: AppTheme.spacingMedium),
                        _socialIcon('GH'),
                        SizedBox(width: AppTheme.spacingMedium),
                        _socialIcon('@'),
                      ],
                    ),
                    SizedBox(height: AppTheme.spacingXLarge),
                    Row(
                      mainAxisAlignment: isNarrow
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryOrange,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppTheme.spacingXLarge,
                              vertical: AppTheme.spacingLarge - 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: AppTheme.borderRadiusXXLarge,
                            ),
                            elevation: 6,
                          ),
                          child: Text(
                            l10n.downloadCV,
                            style: AppTheme.buttonTextStyle.copyWith(
                              color: AppTheme.textWhite,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isNarrow)
                SizedBox(
                  width: AppTheme.spacingLarge,
                  height: AppTheme.spacingLarge,
                ),
              if (!isNarrow) Expanded(flex: 0, child: profileImageWidget),
            ],
          ),
        );
      },
    );
  }

  Widget _socialIcon(String text) {
    Widget icon;
    switch (text) {
      case 'in':
        icon = Assets.images.linkedin.image(height: 24, width: 24);
        break;
      case 'GH':
        icon = Assets.images.github.image(height: 24, width: 24);
        break;
      case '@':
        icon = Assets.images.contact.image(height: 24, width: 24);
        break;
      default:
        icon = Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        );
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppTheme.textWhite.withAlpha(AppTheme.alpha(0.28)),
        ),
        color: AppTheme.textWhite.withAlpha(AppTheme.alpha(0.06)),
      ),
      child: Center(child: icon),
    );
  }
}
