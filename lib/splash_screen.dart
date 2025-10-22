// --- splash_screen.dart (Fade + Scale Animation) ---

import 'package:flutter/material.dart';
import 'package:super_mama/auth_gate.dart';
import 'dart:async'; // Import async

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// Change to TickerProviderStateMixin for multiple controllers if needed later
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  double _opacity = 0.0; // Start fully transparent
  int _beatCount = 0;
  static const int _maxBeats = 3;

  @override
  void initState() {
    super.initState();

    // Controller for the scaling (beat) effect
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.3), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 1.3, end: 1.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeOut));

    _scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _beatCount++;
        if (_beatCount < _maxBeats) {
          _scaleController.forward(from: 0.0);
        } else {
          _navigateToHome();
        }
      }
    });

    // Start the fade-in animation immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _opacity = 1.0); // Animate to fully opaque
      // Start the beating slightly after the fade begins
      Timer(const Duration(milliseconds: 300), () {
        if (mounted) _scaleController.forward();
      });
    });
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthGate()),
      );
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity, // Apply fade-in effect
          duration: const Duration(milliseconds: 800), // Fade-in duration
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 100,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Bloom Mama',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}