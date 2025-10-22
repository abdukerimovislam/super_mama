// --- auth_gate.dart (Simplified) ---

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:super_mama/login_screen.dart';
import 'package:super_mama/main_navigator.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not logged in
        if (!snapshot.hasData) {
          return const LoginScreen();
        }

        // User is logged in, go directly to the main pregnancy app
        return const MainNavigator();
      },
    );
  }
}