// --- week_detail_screen.dart (Corrected) ---
import 'package:flutter/material.dart';
import 'package:bloom_mama/pregnancy_data.dart';
import 'l10n/app_localizations.dart';

class WeekDetailScreen extends StatelessWidget {
  final PregnancyWeek weekData;
  final AppLocalizations loc; // <-- FIX: Add this

  // --- FIX: Add 'loc' to the constructor ---
  const WeekDetailScreen({super.key, required this.weekData, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // --- FIX: Use the 'loc' object that was passed in ---
        title: Text('${loc.homeScreenWeek} ${weekData.weekNumber}'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The rest of your UI here, which uses 'weekData' that is already translated
            Text(
              "Baby's Development", // You can add keys for these titles too
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(weekData.babyDevelopment, style: const TextStyle(fontSize: 16, height: 1.5)),
            const Divider(height: 30),
            Text(
              "Mom's Symptoms",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(weekData.momSymptoms, style: const TextStyle(fontSize: 16, height: 1.5)),
          ],
        ),
      ),
    );
  }
}