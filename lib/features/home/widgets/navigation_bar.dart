import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_site/business_logic/local/locale_provider.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';
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

class _PortfolioNavigationBarState
    extends ConsumerState<PortfolioNavigationBar> {
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
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateArrowVisibility);
    _scrollController.dispose();
    super.dispose();
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
                      _arrowButton(
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
                            _navItem(
                              icon: Icons.home,
                              label: l10n.home,
                              onTap: widget.onHomeTap,
                              showLabel: !isMobile,
                              verticalPad: verticalPad,
                              isSelected: widget.selectedIndex == 0,
                            ),
                            SizedBox(width: navSpacing),
                            _navItem(
                              icon: Icons.person,
                              label: l10n.aboutTitle,
                              onTap: widget.onAboutTap,
                              showLabel: !isMobile,
                              verticalPad: verticalPad,
                              isSelected: widget.selectedIndex == 1,
                            ),
                            SizedBox(width: navSpacing),
                            _navItem(
                              icon: Icons.build,
                              label: l10n.skillsTitle,
                              onTap: widget.onSkillsTap,
                              showLabel: !isMobile,
                              verticalPad: verticalPad,
                              isSelected: widget.selectedIndex == 2,
                            ),
                            SizedBox(width: navSpacing),
                            _navItem(
                              icon: Icons.folder_open,
                              label: l10n.currentProjects,
                              onTap: widget.onProjectsTap,
                              showLabel: !isMobile,
                              verticalPad: verticalPad,
                              isSelected: widget.selectedIndex == 3,
                            ),
                            SizedBox(width: navSpacing),
                            _navItem(
                              icon: Icons.work,
                              label: l10n.experienceTitle,
                              onTap: widget.onExperienceTap,
                              showLabel: !isMobile,
                              verticalPad: verticalPad,
                              isSelected: widget.selectedIndex == 4,
                            ),
                            SizedBox(width: navSpacing),
                            _languageSwitch(
                              currentLocale,
                              localeNotifier,
                              iconOnly: isNarrow,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_showRightArrow)
                      _arrowButton(
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

  Widget _arrowButton({required bool left, required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          width: 36,
          height: 48,
          alignment: Alignment.center,
          child: Icon(
            left
                ? Icons.arrow_back_ios_new_rounded
                : Icons.arrow_forward_ios_rounded,
            color: AppTheme.textWhite.withAlpha(AppTheme.alpha(0.7)),
            size: 22,
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required VoidCallback? onTap,
    required bool showLabel,
    double verticalPad = 8.0,
    bool isSelected = false,
  }) {
    final selectedColor = const Color(0xFF9CC5D3).withOpacity(0.18);
    final selectedTextColor = const Color(0xFF9CC5D3);
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadiusSmall,
        color: isSelected ? selectedColor : Colors.transparent,
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMedium,
            vertical: verticalPad,
          ),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: Colors.transparent,
        ),
        child: showLabel
            ? Row(
                children: [
                  Icon(
                    icon,
                    color: isSelected ? selectedTextColor : AppTheme.textWhite,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    label,
                    style: AppTheme.labelStyle.copyWith(
                      color: isSelected
                          ? selectedTextColor
                          : AppTheme.textWhite,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            : Icon(
                icon,
                color: isSelected ? selectedTextColor : AppTheme.textWhite,
                size: 22,
              ),
      ),
    );
  }

  Widget _languageSwitch(
    Locale currentLocale,
    LocaleNotifier localeNotifier, {
    bool iconOnly = false,
  }) {
    final showLanguageCode = !iconOnly || _showRightArrow || _showLeftArrow;
    return TextButton(
      onPressed: _isToggling
          ? null
          : () => _handleLanguageToggle(localeNotifier),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.language,
            color: _isToggling
                ? AppTheme.textWhite.withAlpha(AppTheme.alpha(0.4))
                : AppTheme.textWhite.withAlpha(AppTheme.alpha(0.8)),
            size: 22,
          ),
          if (showLanguageCode) ...[
            SizedBox(width: AppTheme.spacingSmall - 4),
            _isToggling
                ? SizedBox(
                    width: AppTheme.spacingMedium,
                    height: AppTheme.spacingMedium,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppTheme.textWhite.withAlpha(AppTheme.alpha(0.8)),
                      ),
                    ),
                  )
                : Text(
                    currentLocale.languageCode.toUpperCase(),
                    style: AppTheme.labelStyle.copyWith(
                      color: AppTheme.textWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ],
        ],
      ),
    );
  }

  Future<void> _handleLanguageToggle(LocaleNotifier localeNotifier) async {
    if (_isToggling) return;

    setState(() {
      _isToggling = true;
    });

    // Toggle the language
    localeNotifier.toggleLanguage();

    // Brief delay to allow UI to update and prevent rapid toggling
    await Future.delayed(const Duration(milliseconds: 600));

    if (mounted) {
      setState(() {
        _isToggling = false;
      });
    }
  }
}
