import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FABButtonProfile extends StatelessWidget {
  const FABButtonProfile({super.key});

  void _showProfileActionsModal(BuildContext context) {
    HapticFeedback.mediumImpact();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
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
                  "Profile Actions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionItem(
                      context,
                      icon: Icons.edit,
                      color: Colors.blue,
                      label: "Edit",
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to Edit Profile Screen
                      },
                    ),
                    _buildActionItem(
                      context,
                      icon: Icons.logout,
                      color: Colors.red,
                     label: "Logout",
                      onTap: () {
                        Navigator.pop(context);
                        // Implement Share Profile functionality
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

  Widget _buildActionItem(BuildContext context, {required IconData icon, required Color color, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
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
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.purpleAccent,
      shape: const CircleBorder(),
      onPressed: () => _showProfileActionsModal(context),
      child: const Icon(Icons.more_vert, color: Colors.white, size: 30),
    );
  }
}
