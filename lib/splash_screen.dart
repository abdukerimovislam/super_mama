// --- splash_screen.dart ---

import 'dart:async'; // Required for the Timer
import 'package:flutter/material.dart';
import 'main_navigator.dart'; // We need to know where to go next

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // This function runs once when the widget is first created.
  @override
  void initState() {
    super.initState();
    // We start a timer that will run a function after a 3-second delay.
    Timer(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to the MainNavigator.
      // Navigator.pushReplacement means this screen will be removed from the
      // navigation stack, so the user can't press "back" to get to it.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainNavigator()),
      );
    });
  }

  // This is the UI for our splash screen.
  @override
  Widget build(BuildContext context) {
    // We'll make the background a nice color.
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You could add an Icon or an Image of a logo here later!
            const Icon(Icons.favorite, color: Colors.white, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Super Mama',
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