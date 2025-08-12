import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'template_card.dart';
import 'preview_box.dart';

class TemplateCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> templates;
  final int currentIndex;
  final Function(int) onPageChanged;

  const TemplateCarousel({
    Key? key,
    required this.templates,
    required this.currentIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    if (templates.isEmpty) {
      return Center(
        child: Text(
          "No templates available",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Explore Our Templates",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          CarouselSlider.builder(
            itemCount: templates.length,
            itemBuilder: (context, index, realIndex) {
              final template = templates[index];

              // Default price values
              final double discountedPrice =
                  (template['discountedPrice'] ?? 0.0).toDouble();
              final double originalPrice =
                  (template['originalPrice'] ?? 0.0).toDouble();

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 16.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TemplateCard(
                    templateName:
                        template['name'], // Optional: You can replace this with 'description' or category
                    imagePath: template['image'],
                    isPremium: template['isPremium'],
                    discountedPrice: discountedPrice.toStringAsFixed(2),
                    originalPrice: originalPrice.toStringAsFixed(2),
                    // Inside onPreview callback
                    onPreview: () {
                      FocusScope.of(
                        context,
                      ).unfocus(); // Dismiss the keyboard before showing preview

                      Future.delayed(Duration(milliseconds: 100), () {
                        // Ensure UI refresh
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 24,
                              ), // Prevents overflow
                              child: PreviewDialog(
                                templateName: template['name'],
                                imagePath: template['image'],
                                isPremium: template['isPremium'],
                                discountedPrice: discountedPrice
                                    .toStringAsFixed(
                                      2,
                                    ), // Convert double to String
                                originalPrice: originalPrice.toStringAsFixed(
                                  2,
                                ), // Convert double to String
                              ),
                            );
                          },
                        ).then((_) {
                          FocusScope.of(context).requestFocus(
                            FocusNode(),
                          ); // Ensure focus is cleared
                        });
                      });
                    },
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height:
                  MediaQuery.of(context).size.height *
                  0.6, // Ensure larger card size to fit the image
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              aspectRatio: 1.2,
              onPageChanged: (index, reason) {
                onPageChanged(index);
              },
              autoPlay: false, // Removed auto-scroll for user control
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Swipe to explore more templates ->',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
