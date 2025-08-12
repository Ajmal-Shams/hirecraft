import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DocumentCarousel extends StatelessWidget {
  final String heading;
  final List<Map<String, dynamic>> documents;

  const DocumentCarousel({
    super.key,
    required this.heading,
    required this.documents,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            heading,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 120,
            enableInfiniteScroll: false,
            viewportFraction: 0.85,
            padEnds: false,
            enlargeCenterPage: true,
          ),
          items: documents.map((doc) {
            return DocumentStatusCard(
              title: doc["name"],
              status: doc["status"],
              icon: doc["icon"],
              color: doc["color"],
            );
          }).toList(),
        ),
      ],
    );
  }
}

class DocumentStatusCard extends StatelessWidget {
  final String title;
  final String status;
  final IconData icon;
  final Color color;

  const DocumentStatusCard({
    super.key,
    required this.title,
    required this.status,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      shadowColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14), // Adjusted padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon Container
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Icon(icon, color: color, size: 30),
              ),
            ),
            const SizedBox(width: 14),

            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Prevents unnecessary expansion
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 16, // Slightly reduced from 17
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status,
                    style: GoogleFonts.poppins(
                      fontSize: 13, // Slightly reduced from 14
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
