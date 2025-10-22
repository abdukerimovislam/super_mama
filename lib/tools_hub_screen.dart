// --- tools_hub_screen.dart ---

import 'package:flutter/material.dart';
import 'package:super_mama/contraction_timer_screen.dart';
import 'package:super_mama/kick_counter_screen.dart';
import 'package:super_mama/l10n/app_localizations.dart';


class ToolsHubScreen extends StatelessWidget {
  const ToolsHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.toolsHubTitle), // Localize
        backgroundColor: Colors.deepPurple[200],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card( // Contraction Timer
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.timer_outlined, size: 40, color: Colors.deepPurple),
              title: Text(loc.timersContractionTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(loc.timersContractionSubtitle),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContractionTimerScreen())),
            ),
          ),
          const SizedBox(height: 16),
          Card( // Kick Counter
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.monitor_heart_outlined, size: 40, color: Colors.deepPurple),
              title: Text(loc.timersKickTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(loc.timersKickSubtitle),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const KickCounterScreen())),
            ),
          ),
        ],
      ),
    );
  }
}