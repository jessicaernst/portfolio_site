import 'package:flutter/material.dart';
import 'package:portfolio_site/core/widgets/animated_background.dart';
import 'package:portfolio_site/features/home/widgets/about_section.dart';
import 'package:portfolio_site/features/home/widgets/experience_section.dart';
import 'package:portfolio_site/features/home/widgets/hero_section.dart';
import 'package:portfolio_site/features/home/widgets/navigation/navigation_bar.dart';
import 'package:portfolio_site/features/home/widgets/portfolio_footer.dart';
import 'package:portfolio_site/features/home/widgets/projects_section.dart';
import 'package:portfolio_site/features/home/widgets/skills_section.dart';

class PortfolioScreen extends StatelessWidget {
  static final homeKey = GlobalKey();
  static final aboutKey = GlobalKey();
  static final skillsKey = GlobalKey();
  static final projectsKey = GlobalKey();
  static final experienceKey = GlobalKey();

  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final sectionKeys = [
      homeKey,
      aboutKey,
      skillsKey,
      projectsKey,
      experienceKey,
    ];
    final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

    void handleScroll() {
      for (int i = sectionKeys.length - 1; i >= 0; i--) {
        final keyContext = sectionKeys[i].currentContext;
        if (keyContext != null) {
          final box = keyContext.findRenderObject() as RenderBox?;
          if (box != null) {
            final pos = box.localToGlobal(Offset.zero);
            if (pos.dy < MediaQuery.of(context).size.height * 0.3) {
              selectedIndex.value = i;
              break;
            }
          }
        }
      }
    }

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
              child: ValueListenableBuilder<int>(
                valueListenable: selectedIndex,
                builder: (context, selIdx, _) {
                  return PortfolioNavigationBar(
                    onHomeTap: () =>
                        _scrollToSection(scrollController, homeKey),
                    onAboutTap: () =>
                        _scrollToSection(scrollController, aboutKey),
                    onSkillsTap: () =>
                        _scrollToSection(scrollController, skillsKey),
                    onProjectsTap: () =>
                        _scrollToSection(scrollController, projectsKey),
                    onExperienceTap: () =>
                        _scrollToSection(scrollController, experienceKey),
                    selectedIndex: selIdx,
                  );
                },
              ),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => handleScroll(),
                );
                return false;
              },
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    // Home Section
                    KeyedSubtree(
                      key: homeKey,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: const HeroSection(),
                        ),
                      ),
                    ),
                    // About Section
                    KeyedSubtree(
                      key: aboutKey,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: const AboutSection(isDark: false),
                        ),
                      ),
                    ),
                    // Skills Section
                    KeyedSubtree(
                      key: skillsKey,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: const SkillsSection(isDark: false),
                        ),
                      ),
                    ),
                    // Projects Section
                    KeyedSubtree(
                      key: projectsKey,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1200),
                          child: const ProjectsSection(isDark: false),
                        ),
                      ),
                    ),
                    // Experience Section
                    KeyedSubtree(
                      key: experienceKey,
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
          ),
        ],
      ),
    );
  }

  void _scrollToSection(ScrollController controller, GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
