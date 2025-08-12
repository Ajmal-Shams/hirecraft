import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemplateCard extends StatelessWidget {
  final String templateName;
  final String imagePath;
  final bool isPremium;
  final String? originalPrice;
  final String? discountedPrice;
  final VoidCallback onPreview;

  const TemplateCard({
    Key? key,
    required this.templateName,
    required this.imagePath,
    required this.isPremium,
    this.originalPrice,
    this.discountedPrice,
    required this.onPreview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPreview,
      child: MouseRegion(
        onEnter: (_) => _onHover(),
        onExit: (_) => _onExit(),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
          shadowColor: Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Template Image
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.asset(
                        imagePath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (isPremium)
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Premium",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Template Name & Price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      templateName,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isPremium) _buildPriceInfo(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Price Information for Premium Templates
  Widget _buildPriceInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Original Price (Strikethrough)
          if (originalPrice != null)
            Text(
              originalPrice!,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),

          // Discounted Price
          if (discountedPrice != null)
            Text(
              discountedPrice!,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  void _onHover() {
    // Add hover animation or elevation change if needed
  }

  void _onExit() {
    // Reset animation or elevation if needed
  }
}
