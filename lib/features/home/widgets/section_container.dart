import 'dart:ui';

import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final Widget content;
  final bool isDark;

  const SectionContainer({
    super.key,
    required this.title,
    required this.content,
    this.isDark = true,
  });

  int _alpha(double v) => (v * 255).toInt();

  @override
  Widget build(BuildContext context) {
    final contentWidget = Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withAlpha(_alpha(0.06)) : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: isDark
            ? Border.all(
                color: Colors.white.withAlpha(_alpha(0.08)),
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: isDark
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: contentWidget,
              )
            : contentWidget,
      ),
    );
  }
}
