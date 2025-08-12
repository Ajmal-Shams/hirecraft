import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/components/carousel/quick_action_home.dart';
import '../widgets/components/card/document_status_card.dart';
import '../widgets/components/fab_buttons/fab_button_home.dart';
import '../../../../../widgets/navbar/bottom_nav_bar.dart';
import '../widgets/components/carousel/coming_soon.dart'; // Import the new Coming Soon widget

class JobSeekerHomeScreen extends StatelessWidget {
  const JobSeekerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // 🖼️ Lottie Animation
            Center(
              child: SizedBox(
                height: 180,
                child: Lottie.asset('assets/animations/job_find.json'),
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

            // 📜 Document Status Section with Carousel
            _sectionTitle("Your Documents"),
            _buildDocumentCarousel(
              title: "Resumes",
              documents: [
                {
                  "name": "Resume 1",
                  "status": "Updated 2 days ago",
                  "icon": Icons.article,
                  "color": Colors.blue,
                },
                {
                  "name": "Resume 2",
                  "status": "Pending Review",
                  "icon": Icons.article,
                  "color": Colors.orange,
                },
                {
                  "name": "Resume 3",
                  "status": "Needs Update",
                  "icon": Icons.article,
                  "color": Colors.red,
                },
              ],
            ),
            const SizedBox(height: 10),
            _buildDocumentCarousel(
              title: "Cover Letters",
              documents: [
                {
                  "name": "Cover Letter 1",
                  "status": "Approved",
                  "icon": Icons.mail,
                  "color": Colors.green,
                },
                {
                  "name": "Cover Letter 2",
                  "status": "Pending",
                  "icon": Icons.mail,
                  "color": Colors.purple,
                },
                {
                  "name": "Cover Letter 3",
                  "status": "Needs Update",
                  "icon": Icons.mail,
                  "color": Colors.red,
                },
              ],
            ),

            const SizedBox(height: 20),

            // ⚡ Quick Actions Section
            _sectionTitle("Quick Actions"),
            const ActionCarousel(),
            const SizedBox(height: 20),

            // 🚀 Coming Soon Section (Now a separate file)
            _sectionTitle("Coming Soon"),
            const ComingSoonSection(), // Call the new Coming Soon Widget
            const SizedBox(height: 60),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
      floatingActionButton: const FABButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // 🎨 App Bar
  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome Back,",
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
          ),
          Text(
            "John Doe",
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
          icon: const Icon(
            Icons.sync_alt,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {}, // Add notification action
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {}, // Add notification action
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

  // 🎠 Document Carousel
  Widget _buildDocumentCarousel({
    required String title,
    required List<Map<String, dynamic>> documents,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(title),
        CarouselSlider(
          options: CarouselOptions(
            height: 120,
            enableInfiniteScroll: false,
            viewportFraction: 0.85,
            padEnds: false,
            enlargeCenterPage: true,
          ),
          items:
              documents.map((doc) {
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
