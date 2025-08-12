import 'package:flutter/material.dart';

class FullScreenImagePreview extends StatelessWidget {
  final String imagePath;
  final String tag; // Unique tag for Hero animation

  const FullScreenImagePreview({Key? key, required this.imagePath, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Hero(
          tag: tag, // Use the unique tag
          child: InteractiveViewer(
            panEnabled: true, // Allow panning
            scaleEnabled: true, // Allow zooming
            minScale: 1.0,
            maxScale: 5.0, // Prevent excessive zooming
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/default.png', fit: BoxFit.contain);
              },
            ),
          ),
        ),
      ),
    );
  }
}
