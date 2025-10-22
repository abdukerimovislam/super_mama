// --- uncommon_symptom_detail_screen.dart ---

import 'package:flutter/material.dart';
import 'package:super_mama/uncommon_symptoms_screen.dart'; // Import to get the Symptom class
import 'l10n/app_localizations.dart'; // Import the localizations

class UncommonSymptomDetailScreen extends StatelessWidget {
  final UncommonSymptom symptom;

  const UncommonSymptomDetailScreen({super.key, required this.symptom});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // Get the localized strings

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(loc.uncommonSymptomDetailTitle), // <-- Localized
        backgroundColor: Colors.deepPurple[200],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              symptom.title, // This is already localized from the previous screen
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 16),
            Text(
              symptom.description, // This is already localized
              style: const TextStyle(fontSize: 16, height: 1.5, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const Divider(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc.uncommonSymptomIsItNormal, // <-- Localized
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    symptom.isItNormal, // This is already localized
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}