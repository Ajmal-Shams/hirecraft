import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../widgets/job_seeker/action_card.dart';
import '../../../widgets/job_seeker/career_tip_card.dart';
import '../../../widgets/job_seeker/document_status_card.dart';
import '../../../widgets/navbar/bottom_nav_bar.dart';

class JobSeekerHomeScreen extends StatelessWidget {
  const JobSeekerHomeScreen({super.key});

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
              "Welcome Back,",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
            ),
            Text(
              "John Doe", // Dynamically replace with user's name
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
            onPressed: () {}, // Add notification action
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
                child: Lottie.asset('assets/animations/job_find.json'),
              ),
            ),
            const SizedBox(height: 20),

            // Document Status Section
            Text(
              "Your Documents",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            DocumentStatusCard(
              title: "Resume",
              status: "Updated 2 days ago",
              icon: Icons.article,
              color: Colors.blue,
            ),
            const SizedBox(height: 10),
            DocumentStatusCard(
              title: "Cover Letter",
              status: "Needs Update",
              icon: Icons.mail,
              color: Colors.red,
            ),
            const SizedBox(height: 20),

            // Quick Actions Section
            Text(
              "Quick Actions",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionCard(
                  label: "Jobs",
                  icon: Icons.work,
                  color: Colors.blue,
                  onTap: () {},
                ),
                ActionCard(
                  label: "Profile",
                  icon: Icons.person,
                  color: Colors.green,
                  onTap: () {},
                ),
                ActionCard(
                  label: "Ai Chat",
                  icon: Icons.smart_toy,
                  color: Colors.orange,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Recent Job Postings Section
            
            // Career Tips Section
            Text(
              "Career Tips",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            CareerTipCard(
              title: "Resume Optimization",
              description:
                  "Use keywords from job descriptions to tailor your resume.",
            ),
            CareerTipCard(
              title: "Interview Tips",
              description:
                  "Prepare for common questions and practice your answers.",
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
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
