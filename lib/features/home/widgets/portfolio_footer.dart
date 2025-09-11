import 'package:flutter/material.dart';

class PortfolioFooter extends StatelessWidget {
  final bool isDark;
  const PortfolioFooter({super.key, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white54 : Colors.black54;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          const SizedBox(width: 28),
          Text(
            '© 2025 Jessica Ernst',
            style: TextStyle(color: textColor),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Impressum',
                    style: TextStyle(color: textColor),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Datenschutz',
                    style: TextStyle(color: textColor),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Kontakt',
                    style: TextStyle(color: textColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
