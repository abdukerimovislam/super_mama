// --- symptom_tracker_screen.dart ---

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'symptom_history_screen.dart'; // Use your project's folder name

// UPGRADED DATA MODEL
class Symptom {
  final String name;
  final IconData icon;
  final String definition;
  final String advice;
  bool isSelected;

  Symptom({
    required this.name,
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
  final List<Symptom> _symptoms = [
    Symptom(
        name: 'Nausea',
        icon: Icons.sick_outlined,
        definition: "A feeling of sickness with an inclination to vomit, often called 'morning sickness' but can occur anytime.",
        advice: "Try eating small, frequent meals. Ginger tea or candies can help. Stay hydrated by sipping water throughout the day."),
    Symptom(
        name: 'Fatigue',
        icon: Icons.battery_alert_outlined,
        definition: "An overwhelming feeling of tiredness and lack of energy, especially common in the first and third trimesters.",
        advice: "Listen to your body and rest when you can. Maintain a healthy diet and stay hydrated. Gentle exercise like walking can boost energy."),
    Symptom(
        name: 'Cravings',
        icon: Icons.fastfood_outlined,
        definition: "A strong, sudden desire to eat a particular type of food.",
        advice: "It's okay to indulge in moderation, but try to find healthier alternatives. Ensure your overall diet is balanced and nutritious."),
    Symptom(
        name: 'Back Pain',
        icon: Icons.airline_seat_legroom_extra_outlined,
        definition: "Aches and pains in the lower back area due to hormonal changes, weight gain, and a shifting center of gravity.",
        advice: "Practice good posture. Use a supportive chair. Sleep on your side with a pillow between your knees. A warm bath may provide relief."),
    Symptom(
        name: 'Headache',
        icon: Icons.sentiment_very_dissatisfied,
        definition: "Pain or discomfort in the head or scalp, often caused by hormonal shifts, dehydration, or lack of sleep.",
        advice: "Rest in a quiet, dark room. Apply a cool compress to your forehead. Ensure you're drinking enough water. Consult your doctor before taking any medication."),
    Symptom(
        name: 'Heartburn',
        icon: Icons.local_fire_department_outlined,
        definition: "A burning sensation in the chest, caused by stomach acid flowing back up into the esophagus.",
        advice: "Eat smaller meals more frequently. Avoid spicy, greasy, or acidic foods. Don't lie down immediately after eating."),
    Symptom(
        name: 'Swelling',
        icon: Icons.square_foot_outlined,
        definition: "Mild swelling (edema) in the ankles, feet, and hands, caused by fluid retention.",
        advice: "Elevate your feet whenever possible. Avoid standing for long periods. Wear comfortable shoes and stay hydrated to help flush out excess fluids."),
    Symptom(
        name: 'Cramps',
        icon: Icons.compress,
        definition: "Mild, period-like cramping in the lower abdomen, often due to the uterus expanding.",
        advice: "Change positions, rest, or take a warm bath. If cramping is severe or accompanied by bleeding, contact your doctor immediately."),
  ];
  // --- NEW CODE STARTS HERE ---

  bool _isLoading = true; // <-- NEW: State variable to track loading

  // This function runs automatically once when the screen is first built.
  @override
  void initState() {
    super.initState();
    _loadUserSymptoms(); // <-- NEW: Call our function to load data
  }

  // --- NEW FUNCTION to show the details dialog ---
  void _showSymptomDetailsDialog(Symptom symptom) {
    showDialog(
      context: context,
      builder: (context) {
        // StatefulBuilder is used so the dialog can update its own state
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Row(
                children: [
                  Icon(symptom.icon, color: Colors.deepPurple),
                  const SizedBox(width: 10),
                  Text(symptom.name),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(symptom.definition, style: const TextStyle(fontStyle: FontStyle.italic)),
                    const Divider(height: 20),
                    const Text("What you can do:", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(symptom.advice),
                    const SizedBox(height: 20),
                    // Checkbox to log the symptom
                    CheckboxListTile(
                      title: const Text("I'm experiencing this"),
                      value: symptom.isSelected,
                      onChanged: (bool? value) {
                        // Update the dialog's state AND the main screen's state
                        setDialogState(() {
                          setState(() {
                            symptom.isSelected = value ?? false;
                          });
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      },
    );
  }


  // NEW FUNCTION: Fetches data from Firestore
  Future<void> _loadUserSymptoms() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    // Get today's date, formatted exactly like our document ID
    final today = DateTime.now();
    final formattedDate = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    try {
      // We now look for a document in our history that matches today's date
      final doc = await FirebaseFirestore.instance
          .collection('user_data')
          .doc(user.uid)
          .collection('symptom_history')
          .doc(formattedDate)
          .get()
          .timeout(const Duration(seconds: 10));

      if (doc.exists && doc.data() != null) {
        final savedSymptoms = List<String>.from(doc.data()!['symptoms'] ?? []);
        for (var symptom in _symptoms) {
          symptom.isSelected = savedSymptoms.contains(symptom.name);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not load today\'s symptoms.')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  // --- NEW CODE ENDS HERE ---

  // This function is the same as before
  void _saveSymptomsToFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Handle case where user is not logged in
      return;
    }

    // Get the current date and format it as a string like "2025-10-13"
    final today = DateTime.now();
    final formattedDate = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    final selectedSymptoms = _symptoms.where((s) => s.isSelected).map((s) => s.name).toList();

    try {
      // We now point to a new 'symptom_history' subcollection.
      // The document ID is the date, so each day gets its own document.
      await FirebaseFirestore.instance
          .collection('user_data')
          .doc(user.uid)
          .collection('symptom_history') // <-- This is the new subcollection
          .doc(formattedDate) // <-- We use the date as the document name
          .set({
        'symptoms': selectedSymptoms,
        'date': Timestamp.fromDate(today), // Store the full timestamp for sorting
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Symptoms for today saved!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save symptoms: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Tracker'),
        backgroundColor: Colors.deepPurple[200],
        actions: [ // <-- ADD THIS SECTION
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'View History',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SymptomHistoryScreen()),
              );
            },
          ),
        ],
      ),
      // --- UPDATED UI LOGIC ---
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text("How are you feeling today?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.1),
                itemCount: _symptoms.length,
                itemBuilder: (context, index) {
                  final symptom = _symptoms[index];
                  // The tap now opens the dialog
                  return GestureDetector(
                    onTap: () => _showSymptomDetailsDialog(symptom), // <-- CHANGED
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
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _saveSymptomsToFirebase,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple[400]),
                  child: const Text('Save Symptoms', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}