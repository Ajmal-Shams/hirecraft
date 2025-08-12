import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreviewDialog extends StatelessWidget {
  final String templateName;
  final String imagePath;
  final bool isPremium;
  final String discountedPrice;
  final String originalPrice;

  const PreviewDialog({
    Key? key,
    required this.templateName,
    required this.imagePath,
    required this.isPremium,
    required this.discountedPrice,
    required this.originalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus(); // Remove focus from input fields

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close Button (Top-Right)
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.black54, size: 24),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Premium Badge & Template Name (Above Image)
            if (isPremium)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.amber.shade700, Colors.orange.shade600],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        "Premium Template",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Template Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                templateName,
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 12),

            // Full-Sized Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain, // Ensures full visibility
                width: screenWidth * 0.9, // Responsive width
                height: screenHeight * 0.5, // Takes 50% of screen height
              ),
            ),

            const SizedBox(height: 16),

            // Pricing Section
            if (isPremium)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: EdgeInsets.all(12),
                  width: screenWidth * 0.8, // Responsive width
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Original Price: \$${originalPrice}",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${discountedPrice}",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 20),

            // Buttons Row (Favorite & Select)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.redAccent, size: 28),
                    onPressed: () {
                      // TODO: Implement favorite functionality
                    },
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "Use This Template",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
