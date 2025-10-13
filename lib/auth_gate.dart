// --- auth_gate.dart ---

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import 'main_navigator.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // StreamBuilder listens for changes in the authentication state
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If the snapshot has no data, it means the user is not logged in yet.
        if (!snapshot.hasData) {
          return const LoginScreen();
        }

        // If there is data, it means the user is logged in.
        return const MainNavigator();
      },
    );
  }
}