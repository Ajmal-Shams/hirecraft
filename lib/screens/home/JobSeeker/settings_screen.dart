import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/navbar/bottom_nav_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Settings", style: GoogleFonts.montserrat()),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.red),
            title: Text("Notifications", style: GoogleFonts.poppins(fontSize: 16)),
            trailing: Switch(value: true, onChanged: (bool value) {}),
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.red),
            title: Text("Privacy & Security", style: GoogleFonts.poppins(fontSize: 16)),
            onTap: () {
              // Implement privacy settings
            },
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.red),
            title: Text("Help & Support", style: GoogleFonts.poppins(fontSize: 16)),
            onTap: () {
              // Implement help section
            },
          ),
        ],
      ),
       bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }
}
