// --- timers_hub_screen.dart ---

import 'package:flutter/material.dart';
import 'package:super_mama/contraction_timer_screen.dart';
import 'package:super_mama/kick_counter_screen.dart';
import 'l10n/app_localizations.dart'; // Import the localizations

class TimersHubScreen extends StatelessWidget {
  const TimersHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // Get the localized strings

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.timersHubTitle), // <-- Localized
        backgroundColor: Colors.deepPurple[200],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Card for Contraction Timer
          Card(
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.timer_outlined, size: 40, color: Colors.deepPurple),
              title: Text(loc.timersContractionTitle, style: const TextStyle(fontWeight: FontWeight.bold)), // <-- Localized
              subtitle: Text(loc.timersContractionSubtitle), // <-- Localized
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ContractionTimerScreen()),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Card for Kick Counter
          Card(
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.monitor_heart_outlined, size: 40, color: Colors.deepPurple),
              title: Text(loc.timersKickTitle, style: const TextStyle(fontWeight: FontWeight.bold)), // <-- Localized
              subtitle: Text(loc.timersKickSubtitle), // <-- Localized
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const KickCounterScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}