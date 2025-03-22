import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobSearchScreen extends StatelessWidget {
  const JobSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Search", style: GoogleFonts.montserrat()),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            "Recommended Jobs",
            style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          JobTile(jobTitle: "Software Engineer", company: "Google", location: "California, USA"),
          JobTile(jobTitle: "UI/UX Designer", company: "Meta", location: "Remote"),
          JobTile(jobTitle: "Data Scientist", company: "Amazon", location: "Seattle, USA"),
        ],
      ),
    );
  }
}

class JobTile extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String location;

  const JobTile({super.key, required this.jobTitle, required this.company, required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.work, color: Colors.red),
      title: Text(jobTitle, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text("$company • $location", style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Implement job details screen
      },
    );
  }
}
