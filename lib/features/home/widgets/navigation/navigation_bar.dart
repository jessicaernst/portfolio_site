import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_site/business_logic/local/locale_provider.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
import 'package:portfolio_site/features/home/widgets/navigation/language_switch.dart';
import 'package:portfolio_site/features/home/widgets/navigation/nav_arrow_button.dart';
import 'package:portfolio_site/features/home/widgets/navigation/nav_item.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class PortfolioNavigationBar extends ConsumerStatefulWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onSkillsTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onExperienceTap;
  final int? selectedIndex;
  const PortfolioNavigationBar({
    super.key,
    this.onHomeTap,
    this.onAboutTap,
    this.onSkillsTap,
    this.onProjectsTap,
    this.onExperienceTap,
    this.selectedIndex,
  });

  @override
  ConsumerState<PortfolioNavigationBar> createState() =>
      _PortfolioNavigationBarState();
}

class _PortfolioNavigationBarState extends ConsumerState<PortfolioNavigationBar>
    with WidgetsBindingObserver {
  bool _isToggling = false;
  final ScrollController _scrollController = ScrollController();
  bool _showRightArrow = false;
  bool _showLeftArrow = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateArrowVisibility);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _updateArrowVisibility(),
    );
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.removeListener(_updateArrowVisibility);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _updateArrowVisibility(),
    );
  }

  void _updateArrowVisibility() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final offset = _scrollController.offset;
    final isOverflow = maxScroll > 2;
    final showRight = isOverflow && offset < maxScroll - 2;
    final showLeft = isOverflow && offset > 2;
    if (_showRightArrow != showRight || _showLeftArrow != showLeft) {
      setState(() {
        _showRightArrow = showRight;
        _showLeftArrow = showLeft;
      });
    }
  }

  void _scrollNavBar(double offset) {
    final target = _scrollController.offset + offset;
    _scrollController.animateTo(
      target.clamp(0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final localeNotifier = ref.read(localeNotifierProvider.notifier);
    final currentLocale = ref.watch(localeNotifierProvider);

    final isMobile = MediaQuery.of(context).size.width < 700;
    final isNarrow = MediaQuery.of(context).size.width < 1200;
    final navSpacing = isMobile ? AppTheme.spacingSmall : AppTheme.spacingLarge;
    final navHeight = 72.0;
    final verticalPad = AppTheme.spacingSmall + 4;

    final navItems = [
      {
        'icon': Icons.home,
        'label': l10n.home,
        'onTap': widget.onHomeTap,
        'selected': widget.selectedIndex == 0,
      },
      {
        'icon': Icons.person,
        'label': l10n.aboutTitle,
        'onTap': widget.onAboutTap,
        'selected': widget.selectedIndex == 1,
      },
      {
        'icon': Icons.build,
        'label': l10n.skillsTitle,
        'onTap': widget.onSkillsTap,
        'selected': widget.selectedIndex == 2,
      },
      {
        'icon': Icons.folder_open,
        'label': l10n.currentProjects,
        'onTap': widget.onProjectsTap,
        'selected': widget.selectedIndex == 3,
      },
      {
        'icon': Icons.work,
        'label': l10n.experienceTitle,
        'onTap': widget.onExperienceTap,
        'selected': widget.selectedIndex == 4,
      },
    ];

    return Container(
      height: navHeight,
      padding: EdgeInsets.symmetric(horizontal: AppTheme.paddingPage),
      alignment: Alignment.centerRight,
      child: ClipRRect(
        borderRadius: AppTheme.borderRadiusLarge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppTheme.spacingLarge - 6,
            ),
            color: AppTheme.textWhite.withAlpha(AppTheme.alpha(0.04)),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_showLeftArrow)
                      NavArrowButton(
                        left: true,
                        onTap: () => _scrollNavBar(-180),
                      ),
                    Flexible(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final item in navItems) ...[
                              NavItem(
                                icon: item['icon'] as IconData,
                                label: item['label'] as String,
                                onTap: item['onTap'] as VoidCallback?,
                                showLabel: !isMobile,
                                verticalPad: verticalPad,
                                isSelected: item['selected'] as bool,
                              ),
                              SizedBox(width: navSpacing),
                            ],
                            LanguageSwitch(
                              currentLocale: currentLocale,
                              localeNotifier: localeNotifier,
                              iconOnly: isNarrow,
                              isToggling: _isToggling,
                              showArrow: _showRightArrow || _showLeftArrow,
                              onToggle: () =>
                                  _handleLanguageToggle(localeNotifier),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_showRightArrow)
                      NavArrowButton(
                        left: false,
                        onTap: () => _scrollNavBar(180),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLanguageToggle(LocaleNotifier localeNotifier) async {
    if (_isToggling) return;
    setState(() {
      _isToggling = true;
    });
    localeNotifier.toggleLanguage();
    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) {
      setState(() {
        _isToggling = false;
      });
    }
  }
}
