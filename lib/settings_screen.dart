// --- settings_screen.dart ---

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_gate.dart'; // We need this to navigate back after logout

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // This function handles the logout process
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // After signing out, we navigate back to the AuthGate.
      // pushAndRemoveUntil clears all the screens behind it, so the user can't press "back"
      // and get back into the app. This is very important for security.
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const AuthGate()),
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign out: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the current user to display their email
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: ListView(
        children: [
          // Display User Information
          if (user != null)
            UserAccountsDrawerHeader(
              accountName: Text(user.displayName ?? 'Bloom Mama User'),
              accountEmail: Text(user.email ?? 'No email associated'),
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

          // Settings Options
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              // Ask for confirmation before logging out
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: const Text('Confirm Log Out'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(dialogContext).pop(); // Close the dialog
                        },
                      ),
                      TextButton(
                        child: const Text('Log Out'),
                        onPressed: () {
                          _signOut(context); // Call the sign out function
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            subtitle: const Text('Coming soon'),
            onTap: () {}, // Disabled for now
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            subtitle: const Text('Coming soon'),
            onTap: () {}, // Disabled for now
          ),
        ],
      ),
    );
  }
}