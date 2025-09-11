import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/gen/assets.gen.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  int _alpha(double v) => (v * 255).toInt();

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
          vertical: isNarrow ? 48 : 100,
          horizontal: isNarrow ? 24 : 48,
        );

        final profileImageWidget = Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: imageWidth),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isNarrow ? 24 : 18),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(_alpha(0.06)),
                    borderRadius: BorderRadius.circular(isNarrow ? 24 : 18),
                    border: Border.all(
                      color: Colors.white.withAlpha(_alpha(0.08)),
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
                    if (isNarrow) const SizedBox(height: 24),
                    if (isNarrow) profileImageWidget,
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: isNarrow
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        _socialIcon('in'),
                        const SizedBox(width: 16),
                        _socialIcon('GH'),
                        const SizedBox(width: 16),
                        _socialIcon('@'),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: isNarrow
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryOrange,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                            elevation: 6,
                          ),
                          child: Text(
                            l10n.downloadCV,
                            style: TextStyle(
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
              if (!isNarrow) const SizedBox(width: 24, height: 24),
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
        border: Border.all(color: Colors.white.withAlpha((0.28 * 255).toInt())),
        color: Colors.white.withAlpha((0.06 * 255).toInt()),
      ),
      child: Center(child: icon),
    );
  }
}
