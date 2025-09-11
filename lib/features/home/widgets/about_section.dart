import 'package:flutter/material.dart';
import 'package:portfolio_site/features/home/widgets/section_container.dart';

class AboutSection extends StatelessWidget {
  final bool isDark;
  const AboutSection({super.key, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white.withAlpha(230) : Colors.black;
    return SectionContainer(
      isDark: isDark,
      title: 'Über mich',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
          Text(
            'Ich bringe fundierte Erfahrung in der Entwicklung moderner mobiler Anwendungen mit – kombiniert mit einem ausgeprägten Interesse an neuen Technologien. In agilen, dynamischen Projektumfeldern arbeite ich lösungsorientiert, kommunikationsstark und mit einem klaren Ziel: Nutzerbedürfnisse und Teamdynamik.',
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Dabei schätze ich den Austausch auf Augenhöhe, unterstütze eine offene Feedbackkultur und übernehme gerne Verantwortung.',
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Durch kontinuierliche Weiterbildung erweitere ich mein Wissen gezielt und denke dabei gern über etablierte Grenzen hinaus – immer mit dem Ziel, qualitativ hochwertige, nachhaltige und gemeinsam getragene Ergebnisse zu schaffen.',
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
