// --- main.dart (Simplified) ---

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bloom_mama/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:bloom_mama/auth_gate.dart';
import 'package:bloom_mama/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeLanguage(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode');
    if (languageCode != null) {
      setState(() => _locale = Locale(languageCode));
    }
  }

  void changeLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    setState(() => _locale = locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloom Mama', // Or use loc.appName once context is available
      theme: ThemeData(
        // Use pink as primary for a softer feel, or a lighter purple
        primarySwatch: Colors.pink, // Or Colors.purple with adjustments below
        // Define specific theme colors for more control
        primaryColor: Colors.pink[200], // Lighter pink for AppBars
        scaffoldBackgroundColor: Colors.white, // Keep background clean
        // You can define colors for buttons, text, etc. here too
        colorScheme: ColorScheme.light(
          primary: Colors.pink[300]!,
          secondary: Colors.deepPurple[300]!, // Use purple as accent
      ),
        fontFamily: 'Nunito',
      ),
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), Locale('ru'), Locale('es'),
      ],
      home: const AuthGate(),
    );
  }
}