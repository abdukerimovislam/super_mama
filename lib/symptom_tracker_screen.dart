// --- symptom_tracker_screen.dart (Final Localized Version) ---

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:super_mama/symptom_history_screen.dart';
import 'l10n/app_localizations.dart'; // Import localizations

class Symptom {
  final String name;
  final String category;
  final IconData icon;
  final String definition;
  final String advice;
  bool isSelected;

  Symptom({
    required this.name,
    required this.category,
    required this.icon,
    required this.definition,
    required this.advice,
    this.isSelected = false,
  });
}

class SymptomTrackerScreen extends StatefulWidget {
  const SymptomTrackerScreen({super.key});

  @override
  State<SymptomTrackerScreen> createState() => _SymptomTrackerScreenState();
}

class _SymptomTrackerScreenState extends State<SymptomTrackerScreen> {
  List<Symptom> _allSymptoms = [];
  Map<String, List<Symptom>> _categorizedSymptoms = {};
  bool _isLoading = true;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _initializeSymptoms();
      _loadUserSymptoms();
      _isInitialized = true;
    }
  }

  void _initializeSymptoms() {
    final loc = AppLocalizations.of(context)!;
    _allSymptoms = [
      Symptom(name: loc.symptomNausea, category: loc.symptomCatCommon, icon: Icons.sick_outlined, definition: loc.symptomNauseaDef, advice: loc.symptomNauseaAdv),
      Symptom(name: loc.symptomFatigue, category: loc.symptomCatCommon, icon: Icons.battery_alert_outlined, definition: loc.symptomFatigueDef, advice: loc.symptomFatigueAdv),
      Symptom(name: loc.symptomHeadache, category: loc.symptomCatCommon, icon: Icons.sentiment_very_dissatisfied, definition: loc.symptomHeadacheDef, advice: loc.symptomHeadacheAdv),
      Symptom(name: loc.symptomHeartburn, category: loc.symptomCatCommon, icon: Icons.local_fire_department_outlined, definition: loc.symptomHeartburnDef, advice: loc.symptomHeartburnAdv),
      Symptom(name: loc.symptomConstipation, category: loc.symptomCatCommon, icon: Icons.plumbing, definition: loc.symptomConstipationDef, advice: loc.symptomConstipationAdv),
      Symptom(name: loc.symptomBackPain, category: loc.symptomCatBody, icon: Icons.airline_seat_legroom_extra_outlined, definition: loc.symptomBackPainDef, advice: loc.symptomBackPainAdv),
      Symptom(name: loc.symptomSwelling, category: loc.symptomCatBody, icon: Icons.square_foot_outlined, definition: loc.symptomSwellingDef, advice: loc.symptomSwellingAdv),
      Symptom(name: loc.symptomCramps, category: loc.symptomCatBody, icon: Icons.compress, definition: loc.symptomCrampsDef, advice: loc.symptomCrampsAdv),
      Symptom(name: loc.symptomSkinChanges, category: loc.symptomCatBody, icon: Icons.face_retouching_natural, definition: loc.symptomSkinChangesDef, advice: loc.symptomSkinChangesAdv),
      Symptom(name: loc.symptomCravings, category: loc.symptomCatMood, icon: Icons.fastfood_outlined, definition: loc.symptomCravingsDef, advice: loc.symptomCravingsAdv),
      Symptom(name: loc.symptomMoodSwings, category: loc.symptomCatMood, icon: Icons.psychology, definition: loc.symptomMoodSwingsDef, advice: loc.symptomMoodSwingsAdv),
      Symptom(name: loc.symptomAnxiety, category: loc.symptomCatMood, icon: Icons.sentiment_neutral, definition: loc.symptomAnxietyDef, advice: loc.symptomAnxietyAdv),
    ];
    _categorizeSymptoms();
  }

  void _categorizeSymptoms() {
    _categorizedSymptoms = {};
    for (var symptom in _allSymptoms) {
      if (!_categorizedSymptoms.containsKey(symptom.category)) {
        _categorizedSymptoms[symptom.category] = [];
      }
      _categorizedSymptoms[symptom.category]!.add(symptom);
    }
  }

  Future<void> _loadUserSymptoms() async {
    final loc = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    final today = DateTime.now();
    final formattedDate = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    try {
      final doc = await FirebaseFirestore.instance.collection('user_data').doc(user.uid).collection('symptom_history').doc(formattedDate).get().timeout(const Duration(seconds: 10));
      if (doc.exists && doc.data() != null) {
        final savedSymptoms = List<String>.from(doc.data()!['symptoms'] ?? []);
        for (var symptom in _allSymptoms) {
          symptom.isSelected = savedSymptoms.contains(symptom.name);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.symptomErrorLoad)));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _saveSymptomsToFirebase() async {
    final loc = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final today = DateTime.now();
    final formattedDate = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    final selectedSymptoms = _allSymptoms.where((s) => s.isSelected).map((s) => s.name).toList();

    try {
      await FirebaseFirestore.instance.collection('user_data').doc(user.uid).collection('symptom_history').doc(formattedDate).set({'symptoms': selectedSymptoms, 'date': Timestamp.fromDate(today)});
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.symptomSuccessSave)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(loc.symptomErrorSave(e.toString()))));
    }
  }

  void _showSymptomDetailsDialog(Symptom symptom) {
    final loc = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Row(children: [Icon(symptom.icon, color: Colors.deepPurple), const SizedBox(width: 10), Text(symptom.name)]),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(symptom.definition, style: const TextStyle(fontStyle: FontStyle.italic)),
                    const Divider(height: 20),
                    Text(loc.symptomDialogWhatToDo, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(symptom.advice),
                    const SizedBox(height: 20),
                    CheckboxListTile(
                      title: Text(loc.symptomDialogCheckbox),
                      value: symptom.isSelected,
                      onChanged: (bool? value) {
                        setDialogState(() {
                          setState(() => symptom.isSelected = value ?? false);
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
              actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(loc.symptomDialogClose))],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.symptomTrackerTitle),
        backgroundColor: Colors.deepPurple[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: loc.symptomHistoryTooltip,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SymptomHistoryScreen()));
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _categorizedSymptoms.keys.length,
              itemBuilder: (context, index) {
                final category = _categorizedSymptoms.keys.elementAt(index);
                final symptomsInCategory = _categorizedSymptoms[category]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      child: Text(category, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.1),
                      itemCount: symptomsInCategory.length,
                      itemBuilder: (context, gridIndex) {
                        final symptom = symptomsInCategory[gridIndex];
                        return GestureDetector(
                          onTap: () => _showSymptomDetailsDialog(symptom),
                          child: Card(
                            color: symptom.isSelected ? Colors.deepPurple[100] : Colors.white,
                            elevation: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(symptom.icon, size: 40, color: symptom.isSelected ? Colors.white : Colors.deepPurple),
                                const SizedBox(height: 8),
                                Text(symptom.name, textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _saveSymptomsToFirebase,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple[400]),
                child: Text(loc.symptomTrackerSave, style: const TextStyle(fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}