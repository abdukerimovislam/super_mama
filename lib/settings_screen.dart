// --- settings_screen.dart (Corrected) ---

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:super_mama/auth_gate.dart';
import 'package:super_mama/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/app_localizations.dart'; // Import localizations
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final NotificationService _notificationService = NotificationService();
  bool _affirmationsEnabled = false;
  String _currentMode = 'pregnancy';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }
  // --- NEW: Helper function to get the current language name ---
  String _getCurrentLanguageName(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);
    switch (currentLocale.languageCode) {
      case 'ru':
        return loc.languageRussian;
      case 'es':
        return loc.languageSpanish;
      case 'en':
      default:
        return loc.languageEnglish;
    }
  }

  // --- NEW: Function to show the language selection dialog ---
  void _showLanguageDialog(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(loc.settingsLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text(loc.languageEnglish),
                value: 'en',
                groupValue: Localizations.localeOf(context).languageCode,
                onChanged: (value) => _changeLanguage(value!),
              ),
              RadioListTile<String>(
                title: Text(loc.languageRussian),
                value: 'ru',
                groupValue: Localizations.localeOf(context).languageCode,
                onChanged: (value) => _changeLanguage(value!),
              ),
              RadioListTile<String>(
                title: Text(loc.languageSpanish),
                value: 'es',
                groupValue: Localizations.localeOf(context).languageCode,
                onChanged: (value) => _changeLanguage(value!),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(loc.settingsCancel),
            ),
          ],
        );
      },
    );
  }

  // --- NEW: Function to save and apply the language change ---
  void _changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
    MyApp.setLocale(context, Locale(languageCode));
    Navigator.of(context).pop(); // Close the dialog
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;
    String? savedMode = prefs.getString('user_mode');

    // If not in prefs, try loading from Firebase (needed if user logs in on new device)
    if (savedMode == null && user != null) {
      final doc = await FirebaseFirestore.instance.collection('user_data').doc(user.uid).get();
      final data = doc.data() as Map<String, dynamic>?;
      if (data != null && data.containsKey('user_mode')) {
        savedMode = data['user_mode'];
      }
    }

    setState(() {
      _affirmationsEnabled = prefs.getBool('affirmationsEnabled') ?? false;
      _currentMode = savedMode ?? 'pregnancy'; // Default to pregnancy if nothing found
    });
  }


  Future<void> _onModeSwitch(String newMode) async {
    if (newMode == _currentMode) return; // No change needed

    setState(() {
      _currentMode = newMode;
    });

    // Save preference locally
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_mode', newMode);

    // Save preference to Firebase
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('user_data').doc(user.uid).set({
        'user_mode': newMode,
      }, SetOptions(merge: true));
    }

    // IMPORTANT: Trigger a full app restart or rebuild to apply theme changes
    // and navigate to the correct main screen. For simplicity, we'll
    // navigate back to the AuthGate which will handle the redirection.
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const AuthGate()),
          (route) => false,
    );
  }


  Future<void> _onAffirmationToggle(bool value) async {
    final loc = AppLocalizations.of(context)!; // Get localizations
    setState(() {
      _affirmationsEnabled = value;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('affirmationsEnabled', value);

    if (value) {
      await _notificationService.scheduleDailyAffirmations(loc);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.settingsAffirmationsEnabled)), // <-- Localized
      );
    } else {
      await _notificationService.cancelAllNotifications();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.settingsAffirmationsDisabled)), // <-- Localized
      );
    }
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const AuthGate()),
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final loc = AppLocalizations.of(context)!; // Get localizations

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(loc.settingsTitle), // <-- Localized
        backgroundColor: Colors.deepPurple[200],
      ),
      body: ListView(
        children: [
          if (user != null)
            UserAccountsDrawerHeader(
              accountName: Text(user.displayName ?? loc.settingsUserFallbackName), // <-- Localized
              accountEmail: Text(user.email ?? loc.settingsUserFallbackEmail), // <-- Localized
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  user.email?.substring(0, 1).toUpperCase() ?? 'U',
                  style: const TextStyle(fontSize: 40.0, color: Colors.deepPurple),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple[200],
              ),
            ),

          // --- NEW: Mode Switcher Section ---
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(loc.settingsLanguage),
            subtitle: Text(_getCurrentLanguageName(context)),
            onTap: () => _showLanguageDialog(context),
          ),
          const Divider(),

          SwitchListTile(
            title: Text(loc.settingsDailyAffirmations), // <-- Localized
            subtitle: Text(loc.settingsDailyAffirmationsSubtitle), // <-- Localized
            value: _affirmationsEnabled,
            onChanged: _onAffirmationToggle,
            secondary: const Icon(Icons.favorite_outline),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(loc.settingsLogOut), // <-- Localized
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: Text(loc.settingsLogOutConfirmTitle), // <-- Localized
                    content: Text(loc.settingsLogOutConfirm), // <-- Localized
                    actions: <Widget>[
                      TextButton(
                        child: Text(loc.settingsCancel), // <-- Localized
                        onPressed: () => Navigator.of(dialogContext).pop(),
                      ),
                      TextButton(
                        child: Text(loc.settingsLogOut), // <-- Localized
                        onPressed: () => _signOut(context),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}