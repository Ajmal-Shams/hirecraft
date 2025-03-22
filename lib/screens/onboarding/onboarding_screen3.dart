import 'package:flutter/material.dart';
import '../../widgets/onboarding/onboarding_content.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingContent(
      animationPath: "assets/animations/resume_submit.json",
      title: "Apply with Confidence",
      description: "Use AI-powered tools to customize your job applications.",
      nextRoute: "/login",
    );
  }
}
