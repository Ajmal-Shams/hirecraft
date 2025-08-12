// premium_section.dart
import 'package:flutter/material.dart';
import 'template_carousel.dart';

class PremiumSection extends StatelessWidget {
  final List<Map<String, dynamic>> templates;
  final int currentIndex;
  final Function(int) onPageChanged;

  const PremiumSection({
    Key? key,
    required this.templates,
    required this.currentIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Premium Templates"),
        const SizedBox(height: 16),
        TemplateCarousel(
          templates: templates,
          currentIndex: currentIndex,
          onPageChanged: onPageChanged,
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  // Section Title Widget
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
