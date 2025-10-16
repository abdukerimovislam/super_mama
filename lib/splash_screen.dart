// --- splash_screen.dart (with Beating Heart Animation) ---

import 'package:flutter/material.dart';
import 'package:super_mama/auth_gate.dart'; // Ensure this is the correct path to your AuthGate

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  int _beatCount = 0; // To track how many beats have occurred
  static const int _maxBeats = 3; // Number of beats before navigating

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400), // Duration for one pulse (half beat)
    );

    // Creates a Tween that animates from 1.0 (normal size) to 1.3 (larger) and back
    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.3), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 1.3, end: 1.0), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut, // A gentle outward pulse
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _beatCount++;
        if (_beatCount < _maxBeats) {
          _animationController.forward(from: 0.0); // Repeat the animation
        } else {
          // All beats done, navigate to the next screen
          _navigateToHome();
        }
      }
    });

    _animationController.forward(); // Start the first beat
  }

  void _navigateToHome() async {
    // Add a small delay after the last beat before navigating,
    // to allow the animation to fully resolve and feel natural.
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthGate()),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200], // Match your app bar color for seamless transition
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation, // Apply the beating animation here
              child: const Icon(
                Icons.favorite, // Your logo image
                color: Colors.white,
                size: 100,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bloom Mama',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}