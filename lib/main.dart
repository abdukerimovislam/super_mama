// --- main.dart (Final Version) ---

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth_gate.dart';

// The main function is now async
Future<void> main() async {
  // Ensure that Flutter is ready before we run anything.
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase using the generated options file.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Now we can run our app.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
  return const MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Bloom Mama', // Changed from Super Mama
  home: AuthGate(),
  );
  }
}