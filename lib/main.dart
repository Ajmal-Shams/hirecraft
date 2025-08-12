import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/otp_screen.dart';

void main() {
  runApp(const HireCraftAI());
}

class HireCraftAI extends StatelessWidget {
  const HireCraftAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HireCraft AI',
      theme: ThemeData(primaryColor: Colors.red, fontFamily: 'Poppins'),
      initialRoute: '/',
      routes: {
      
        '/': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/otp': (context) => const OtpScreen(),
      },
    );
  }
}