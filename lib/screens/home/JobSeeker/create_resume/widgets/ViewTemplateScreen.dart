import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fullscreen_preview.dart'; // Import the full-screen preview

class ViewAllTemplatesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> templates;
  final String title;

  const ViewAllTemplatesScreen({Key? key, required this.templates, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final template = templates[index];

          // Ensure key exists, fallback to a default value
          final String imagePath = template['image'] ?? 'assets/images/default.png';
          final String name = template['name'] ?? 'Unknown Template';

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  // Open full-screen preview when image is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImagePreview(
                        imagePath: imagePath,
                        tag: 'template_$index', // Unique Hero tag
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'template_$index', // Ensure a unique tag
                  child: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/default.png', width: 50, height: 50);
                    },
                  ),
                ),
              ),
              title: Text(name, style: GoogleFonts.poppins(fontSize: 16)),

              // Add Favorite & Select buttons
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {
                      // Handle favorite action
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle template selection
                    },
                    child: const Text("Select"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
