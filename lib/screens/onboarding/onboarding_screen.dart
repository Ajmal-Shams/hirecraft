import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "animation": "assets/animations/resume_typing.json",
      "title": "Build AI Resumes",
      "description": "Create professional AI-generated resumes with ease.",
    },
    {
      "animation": "assets/animations/resume_analysis.json",
      "title": "Get Noticed by Recruiters",
      "description": "Our AI optimizes your resume for better job opportunities.",
    },
    {
      "animation": "assets/animations/resume_submit.json",
      "title": "Apply with Confidence",
      "description": "Use AI-powered tools to customize your job applications.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 320,
                      child: Lottie.asset(
                        onboardingData[index]["animation"]!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      onboardingData[index]["title"]!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        onboardingData[index]["description"]!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingData.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.red,
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    if (currentPage == onboardingData.length - 1) {
                      Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    } else {
                      _pageController.animateToPage(
                        currentPage + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    padding: const EdgeInsets.all(20),  // Increased size
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 28), // Increased size
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
