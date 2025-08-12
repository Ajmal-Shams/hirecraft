import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../create_resume/screens/template_screen.dart';

class ResumeFAB extends StatelessWidget {
  const ResumeFAB({super.key});

  void _showResumeActions(BuildContext context) {
    HapticFeedback.mediumImpact(); // Haptic feedback for better UX

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.35, // Adjust height for better usability
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Resume Actions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _resumeAction(
                      context,
                      icon: Icons.edit_document,
                      label: "Create",
                      color: Colors.blue,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                     TemplateSelectionScreen(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    _resumeAction(
                      context,
                      icon: Icons.auto_fix_high,
                      label: "Optimize",
                      color: Colors.green,
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Optimizing Resume with AI..."),
                          ),
                        );
                      },
                    ),
                    _resumeAction(
                      context,
                      icon: Icons.upload_file,
                      label: "Upload",
                      color: Colors.blue,
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Opening Resume Uploader..."),
                          ),
                        );
                      },
                    ),

                    _resumeAction(
                      context,
                      icon: Icons.share,
                      label: "Share",
                      color: Colors.orange,
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Preparing to Share Resume..."),
                          ),
                        );

                        // Add actual sharing functionality here
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _resumeAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 40, color: color),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      shape: const CircleBorder(),
      onPressed: () => _showResumeActions(context),
      child: const Icon(
        Icons.menu,
        color: Colors.white,
        size: 30,
      ), // Updated icon
    );
  }
}
