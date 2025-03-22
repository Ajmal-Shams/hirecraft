import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile", style: GoogleFonts.montserrat()),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User Information",
              style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person, color: Colors.red),
              title: Text("John Doe", style: GoogleFonts.poppins(fontSize: 16)),
              subtitle: Text("Software Developer"),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.red),
              title: Text("johndoe@example.com", style: GoogleFonts.poppins(fontSize: 16)),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.red),
              title: Text("+123 456 7890", style: GoogleFonts.poppins(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
