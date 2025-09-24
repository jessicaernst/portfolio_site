import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_site/business_logic/navigation/navigation_provider.dart';
import 'package:portfolio_site/core/widgets/animated_background.dart';
import 'package:portfolio_site/features/home/widgets/about_section.dart';
import 'package:portfolio_site/features/home/widgets/experience_section.dart';
import 'package:portfolio_site/features/home/widgets/hero_section.dart';
import 'package:portfolio_site/features/home/widgets/navigation/navigation_bar.dart';
import 'package:portfolio_site/features/home/widgets/portfolio_footer.dart';
import 'package:portfolio_site/features/home/widgets/projects_section.dart';
import 'package:portfolio_site/features/home/widgets/skills_section.dart';

/// A [ConsumerStatefulWidget] that represents the main portfolio screen,
/// containing multiple sections such as Home, About, Skills, Projects, and Experience.
///
/// Provides navigation between sections using a fixed navigation bar and smooth scrolling.
/// Each section is identified by a [GlobalKey] for scroll and visibility tracking.
///
/// The screen listens to scroll events to update the selected navigation section
/// based on the user's scroll position. Navigation bar taps scroll to the corresponding section.
///
/// Uses Riverpod for state management to track the selected section.
///
/// The main content is wrapped in a [SingleChildScrollView] and includes animated background,
/// navigation bar, and all portfolio sections.
class PortfolioScreen extends ConsumerStatefulWidget {
  static final homeKey = GlobalKey();
  static final aboutKey = GlobalKey();
  static final skillsKey = GlobalKey();
  static final projectsKey = GlobalKey();
  static final experienceKey = GlobalKey();

  const PortfolioScreen({super.key});

  @override
  ConsumerState<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends ConsumerState<PortfolioScreen> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(handleScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(handleScroll);
    scrollController.dispose();
    super.dispose();
  }

  List<GlobalKey> get sectionKeys => [
    PortfolioScreen.homeKey,
    PortfolioScreen.aboutKey,
    PortfolioScreen.skillsKey,
    PortfolioScreen.projectsKey,
    PortfolioScreen.experienceKey,
  ];

  void handleScroll() {
    final screenHeight = MediaQuery.of(context).size.height;
    for (int i = sectionKeys.length - 1; i >= 0; i--) {
      final keyContext = sectionKeys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox?;
        if (box != null) {
          final pos = box.localToGlobal(Offset.zero);
          if (pos.dy < screenHeight * 0.3) {
            ref.read(navigationNotifierProvider.notifier).selectSection(i);
            break;
          }
        }
      }
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      debugPrint('Section context not found for scrolling.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(navigationNotifierProvider);

    return Scaffold(
      body: Stack(
        children: [
          const AnimatedBackground(),
          // Fixed Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: PortfolioNavigationBar(
                onHomeTap: () => scrollToSection(PortfolioScreen.homeKey),
                onAboutTap: () => scrollToSection(PortfolioScreen.aboutKey),
                onSkillsTap: () => scrollToSection(PortfolioScreen.skillsKey),
                onProjectsTap: () =>
                    scrollToSection(PortfolioScreen.projectsKey),
                onExperienceTap: () =>
                    scrollToSection(PortfolioScreen.experienceKey),
                selectedIndex: selectedIndex,
              ),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  KeyedSubtree(
                    key: PortfolioScreen.homeKey,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: const HeroSection(),
                      ),
                    ),
                  ),
                  KeyedSubtree(
                    key: PortfolioScreen.aboutKey,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: const AboutSection(isDark: false),
                      ),
                    ),
                  ),
                  KeyedSubtree(
                    key: PortfolioScreen.skillsKey,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: const SkillsSection(isDark: false),
                      ),
                    ),
                  ),
                  KeyedSubtree(
                    key: PortfolioScreen.projectsKey,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: const ProjectsSection(isDark: false),
                      ),
                    ),
                  ),
                  KeyedSubtree(
                    key: PortfolioScreen.experienceKey,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: const ExperienceSection(),
                      ),
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
