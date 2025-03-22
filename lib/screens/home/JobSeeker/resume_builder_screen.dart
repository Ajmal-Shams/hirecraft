import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/navbar/bottom_nav_bar.dart';

class ResumeBuilderScreen extends StatelessWidget {
  const ResumeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Resume Builder", style: GoogleFonts.montserrat()),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Build Your Resume with AI",
              style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Enter your details and let AI generate a professional resume for you.",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement AI resume builder logic
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Start Building", style: GoogleFonts.poppins(fontSize: 16)),
            ),
          ],
        ),
      ),
        bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
           floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Add New Resume / Cover Letter")),
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
