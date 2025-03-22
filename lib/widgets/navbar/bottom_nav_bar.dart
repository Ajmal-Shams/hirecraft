import 'package:flutter/material.dart';

import '../../screens/home/JobSeeker/ai_chatbot_screen.dart';
import '../../screens/home/JobSeeker/job_seeker_home.dart.dart';
import '../../screens/home/JobSeeker/resume_builder_screen.dart';
import '../../screens/home/JobSeeker/settings_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({super.key, required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return; // Prevent unnecessary navigation

    Widget screen;
    switch (index) {
      case 0:
        screen = const JobSeekerHomeScreen();
        break;
      case 1:
        screen = const ResumeBuilderScreen();
        break;
      case 2:
        screen = const AIChatScreen ();
        break;
      case 3:
        screen = const SettingsScreen();
        break;
      default:
        screen = const JobSeekerHomeScreen();
    }

    // Custom Fade Transition
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
 Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 0, context),
          _buildNavItem(Icons.description, 1, context), // Resumes
          const SizedBox(width: 40), // Space for FAB
          _buildNavItem(Icons.smart_toy, 2, context), // AI Chatbot
          _buildNavItem(Icons.settings, 3, context), // Settings
        ],
      ),
    );
  }

 Widget _buildNavItem(IconData icon, int index, BuildContext context) {
    bool isSelected = selectedIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        size: 30,
        color: isSelected ? Colors.red : Colors.black,
      ),
      onPressed: () => _onItemTapped(context, index),
    );
  }
}

