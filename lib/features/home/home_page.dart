import 'package:flutter/material.dart';
import 'package:portfolio_site/features/home/widgets/about_section.dart';
import 'package:portfolio_site/features/home/widgets/animated_background.dart';
import 'package:portfolio_site/features/home/widgets/experience_section.dart';
import 'package:portfolio_site/features/home/widgets/hero_section.dart';
import 'package:portfolio_site/features/home/widgets/navigation_bar.dart';
import 'package:portfolio_site/features/home/widgets/portfolio_footer.dart';
import 'package:portfolio_site/features/home/widgets/projects_section.dart';
import 'package:portfolio_site/features/home/widgets/skills_section.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const PortfolioNavigationBar(),
                  const SizedBox(height: 20),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: const HeroSection(),
                    ),
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: const AboutSection(isDark: false),
                    ),
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: const SkillsSection(isDark: false),
                    ),
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: const ProjectsSection(isDark: false),
                    ),
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: const ExperienceSection(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const PortfolioFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
