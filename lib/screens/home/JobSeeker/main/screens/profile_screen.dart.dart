import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../widgets/navbar/bottom_nav_bar.dart';
import '../widgets/components/fab_buttons/fab_button_profile.dart'; // Import the FAB

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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


            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            

            // User Name
            Text(
              "John Doe",
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "johndoe@example.com",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            // Profile Options
            _buildProfileOption(Icons.person, "Personal Details", () {}),
            _buildProfileOption(Icons.work, "Work Experience", () {}),
            _buildProfileOption(Icons.school, "Education & Skills", () {}),
            _buildProfileOption(Icons.lock, "Change Password", () {}),
            _buildProfileOption(Icons.logout, "Logout", () {}),

            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
      floatingActionButton: const FABButtonProfile(), // Add FAB here
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
      onTap: onTap,
    );
  }
}
