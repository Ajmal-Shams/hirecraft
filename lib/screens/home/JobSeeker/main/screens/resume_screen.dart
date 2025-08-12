import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../widgets/components/carousel/quick_action_home.dart'; // Import the new carousel widget
import '../widgets/components/carousel/coming_soon.dart';
import '../widgets/components/card/document_status_card.dart';
import '../widgets/components/fab_buttons/fab_button_resume.dart';
import '../../../../../widgets/navbar/bottom_nav_bar.dart';

class ResumeBuilderScreen extends StatelessWidget {
  const ResumeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Build Your Resume",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
            ),
            Text(
              "With AI Assistance",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Lottie Animation
            Center(
              child: SizedBox(
                height: 180,
                child: Lottie.asset('assets/animations/resumescreen.json'),
              ),
            ),
            const SizedBox(height: 20),
             // 📢 Banner Ad Space
            Container(
              height: 60, // Adjust the height as per your ad requirement
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.grey[200], // Placeholder color
              child: Text(
                "Banner Ad Here",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 20),

            // Document Status Section
            Text(
              "Your Resume Status",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

          
             _buildDocumentCarousel(
              title: "",
              documents: [
                {"name": "Resume 1", "status": "Updated 2 days ago", "icon": Icons.article, "color": Colors.blue},
                {"name": "Resume 2", "status": "Pending Review", "icon": Icons.article, "color": Colors.orange},
                {"name": "Resume 3", "status": "Needs Update", "icon": Icons.article, "color": Colors.red},
              ],
            ),
            const SizedBox(height: 10),

            // Quick Actions Section (Now using Carousel)
            Text(
              "Quick Actions",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            const ActionCarousel(), // Use the new ActionCarousel widget

            const SizedBox(height: 20),

            // Career Tips Section
            Text(
              "Resume Tips",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
              // 🚀 Coming Soon Section (Now a separate file)
            _sectionTitle("Coming Soon"),
            const ComingSoonSection(), // Call the new Coming Soon Widget
            const SizedBox(height: 60),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      floatingActionButton: const ResumeFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  // Widget to Build Document Carousel
  Widget _buildDocumentCarousel({required String title, required List<Map<String, dynamic>> documents}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
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
   // 📌 Section Title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
