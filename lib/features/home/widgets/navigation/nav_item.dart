import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_site/core/theme/app_theme.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool showLabel;
  final double verticalPad;
  final bool isSelected;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.showLabel,
    this.verticalPad = 8.0,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = AppTheme.highlightBlue.withAlpha(
      AppTheme.alpha(0.18),
    );
    final selectedTextColor = AppTheme.highlightBlue;
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
}
