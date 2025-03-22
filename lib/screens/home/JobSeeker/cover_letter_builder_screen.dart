import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/navbar/bottom_nav_bar.dart';

class CoverLetterBuilderScreen extends StatelessWidget {
  const CoverLetterBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Cover Letter Builder", style: GoogleFonts.montserrat()),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create a Cover Letter with AI",
              style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Provide your job details, and AI will craft a customized cover letter for you.",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement AI cover letter builder logic
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Generate Cover Letter", style: GoogleFonts.poppins(fontSize: 16)),
            ),
          ],
        ),
      ),
       bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
    );
  }
}
