import 'package:flutter/material.dart';
import '../../widgets/onboarding/onboarding_content.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingContent(
      animationPath: "assets/animations/resume_analysis.json",
      title: "Get Noticed by Recruiters",
      description: "Our AI optimizes your resume for better job opportunities.",
      nextRoute: "/onboarding3",
    );
  }
}
