import 'package:flutter/material.dart';
import 'package:portfolio_site/l10n/gen/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(AppLocalizations.of(context).app_title)),
    );
  }
}
