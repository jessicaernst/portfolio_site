import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_site/portfolio_app.dart';

void main() {
  // GDPR compliance: Disable automatic Google Fonts download
  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(const ProviderScope(child: PortfolioApp()));
}
