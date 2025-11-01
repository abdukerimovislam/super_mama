// --- uncommon_symptoms_screen.dart ---

import 'package:flutter/material.dart';
import 'package:bloom_mama/uncommon_symptom_detail_screen.dart';
import 'l10n/app_localizations.dart'; // Import localizations

// Data model is unchanged
class UncommonSymptom {
  final String title;
  final String description;
  final String isItNormal;

  const UncommonSymptom({
    required this.title,
    required this.description,
    required this.isItNormal,
  });
}

// Convert to StatefulWidget
class UncommonSymptomsScreen extends StatefulWidget {
  const UncommonSymptomsScreen({super.key});

  @override
  State<UncommonSymptomsScreen> createState() => _UncommonSymptomsScreenState();
}

class _UncommonSymptomsScreenState extends State<UncommonSymptomsScreen> {
  List<UncommonSymptom> _symptomsList = [];
  bool _isInitialized = false;

  // Initialize the list here to access context
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final loc = AppLocalizations.of(context)!;
      _symptomsList = [
        UncommonSymptom(title: loc.uncommonSymptom1Title, description: loc.uncommonSymptom1Desc, isItNormal: loc.uncommonSymptom1Normal),
        UncommonSymptom(title: loc.uncommonSymptom2Title, description: loc.uncommonSymptom2Desc, isItNormal: loc.uncommonSymptom2Normal),
        UncommonSymptom(title: loc.uncommonSymptom3Title, description: loc.uncommonSymptom3Desc, isItNormal: loc.uncommonSymptom3Normal),
        UncommonSymptom(title: loc.uncommonSymptom4Title, description: loc.uncommonSymptom4Desc, isItNormal: loc.uncommonSymptom4Normal),
        UncommonSymptom(title: loc.uncommonSymptom5Title, description: loc.uncommonSymptom5Desc, isItNormal: loc.uncommonSymptom5Normal),
        UncommonSymptom(title: loc.uncommonSymptom6Title, description: loc.uncommonSymptom6Desc, isItNormal: loc.uncommonSymptom6Normal),
        UncommonSymptom(title: loc.uncommonSymptom7Title, description: loc.uncommonSymptom7Desc, isItNormal: loc.uncommonSymptom7Normal),
        UncommonSymptom(title: loc.uncommonSymptom8Title, description: loc.uncommonSymptom8Desc, isItNormal: loc.uncommonSymptom8Normal),
        UncommonSymptom(title: loc.uncommonSymptom9Title, description: loc.uncommonSymptom9Desc, isItNormal: loc.uncommonSymptom9Normal),
        UncommonSymptom(title: loc.uncommonSymptom10Title, description: loc.uncommonSymptom10Desc, isItNormal: loc.uncommonSymptom10Normal),
        UncommonSymptom(title: loc.uncommonSymptom11Title, description: loc.uncommonSymptom11Desc, isItNormal: loc.uncommonSymptom11Normal),
        UncommonSymptom(title: loc.uncommonSymptom12Title, description: loc.uncommonSymptom12Desc, isItNormal: loc.uncommonSymptom12Normal),
        UncommonSymptom(title: loc.uncommonSymptom13Title, description: loc.uncommonSymptom13Desc, isItNormal: loc.uncommonSymptom13Normal),
        UncommonSymptom(title: loc.uncommonSymptom14Title, description: loc.uncommonSymptom14Desc, isItNormal: loc.uncommonSymptom14Normal),
        UncommonSymptom(title: loc.uncommonSymptom15Title, description: loc.uncommonSymptom15Desc, isItNormal: loc.uncommonSymptom15Normal),
      ];
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(loc.isItNormalTitle), // <-- Localized
        backgroundColor: Colors.deepPurple[200],
      ),
      body: ListView.builder(
        itemCount: _symptomsList.length,
        itemBuilder: (context, index) {
          final symptom = _symptomsList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(symptom.title), // <-- Already localized from the list
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UncommonSymptomDetailScreen(symptom: symptom),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}