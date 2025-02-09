import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          OnboardingPage(
            title: "Welcome to SereniTee",
            description: "Track your mood and wellness easily.",
            image: "assets/onboarding1.png",
          ),
          OnboardingPage(
            title: "Get Wellness Tips",
            description: "Receive personalized tips for a healthier lifestyle.",
            image: "assets/onboarding2.png",
          ),
          OnboardingPage(
            title: "Set Reminders",
            description: "Never forget your self-care tasks.",
            image: "assets/onboarding3.png",
            isLastPage: true,
            onLastPageButtonPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final bool isLastPage;
  final VoidCallback? onLastPageButtonPressed;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
    this.isLastPage = false,
    this.onLastPageButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(image)),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.poppins(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          if (isLastPage)
            ElevatedButton(
              onPressed: onLastPageButtonPressed,
              child: Text("Get Started"),
            ),
        ],
      ),
    );
  }
}
