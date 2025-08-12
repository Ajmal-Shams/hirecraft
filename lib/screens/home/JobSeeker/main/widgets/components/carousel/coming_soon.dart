import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';

class ComingSoonSection extends StatefulWidget {
  const ComingSoonSection({super.key});

  @override
  _ComingSoonSectionState createState() => _ComingSoonSectionState();
}

class _ComingSoonSectionState extends State<ComingSoonSection> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> upcomingFeatures = [
    {
        "title": "AI Job Finder",
      "description": "",
      "lottie": "assets/animations/AiJobFind.json",
    },
    {
       "title": "One-Click Apply",
      "description": "",
      "lottie": "assets/animations/refresh.json",
    },
    {
      "title": "Virtual Interview",
      "description": "",
      "lottie": "assets/animations/working.json",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: upcomingFeatures.length,
          options: CarouselOptions(
            height: 140, // Increased height for a bigger card
        
            enableInfiniteScroll: true,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final feature = upcomingFeatures[index];
            return Card(
              elevation: 4, // Light shadow for better visibility
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              color: Colors.grey[400],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100, // Bigger animation space
                      child: Lottie.asset(feature["lottie"]),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            feature["title"],
                            style: GoogleFonts.montserrat(
                              fontSize: 18, // Bigger text
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            feature["description"],
                            style: GoogleFonts.poppins(
                              fontSize: 14, // More readable text
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: upcomingFeatures.asMap().entries.map((entry) {
            return Container(
              width: _currentIndex == entry.key ? 10 : 8,
              height: _currentIndex == entry.key ? 10 : 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == entry.key
                    ? Colors.blue
                    : Colors.grey.shade400,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
