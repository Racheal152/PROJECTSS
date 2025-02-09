import 'package:flutter/material.dart';
import 'package:pinkpay_app/screens/login_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Animation controller for custom animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    // Automatically transition to the login screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade500,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo with custom animation
              _topImageSection(),
              const SizedBox(height: 20),

              // Middle screen text
              _middleScreenText(),

              // Progress indicator (optional)
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Animated logo section with scale animation
  Widget _topImageSection() {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      )),
      child: Image.asset(
        'assets/images/splash.jpg',
        height: 150,
        width: 150,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.error,
            color: Colors.white,
            size: 100,
          );
        },
      ),
    );
  }

  // Middle screen text
  Widget _middleScreenText() {
    return Column(
      children: const [
        Text(
          "Welcome to PinkPay",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Your Pocket-Friendly Payment Solution",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
