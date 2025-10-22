// --- symptom_history_screen.dart ---

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'l10n/app_localizations.dart'; // Import the localizations
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SymptomLog {
  final DateTime date;
  final List<String> symptoms;

  SymptomLog({required this.date, required this.symptoms});
}

class SymptomHistoryScreen extends StatefulWidget {
  const SymptomHistoryScreen({super.key});

  @override
  State<SymptomHistoryScreen> createState() => _SymptomHistoryScreenState();
}

class _SymptomHistoryScreenState extends State<SymptomHistoryScreen> {
  late final Future<List<SymptomLog>> _historyFuture;

  @override
  void initState() {
    super.initState();
    _historyFuture = _fetchHistory();
  }

  Future<List<SymptomLog>> _fetchHistory() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return [];

    final snapshot = await FirebaseFirestore.instance
        .collection('user_data')
        .doc(user.uid)
        .collection('symptom_history')
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      return SymptomLog(
        date: (doc.data()['date'] as Timestamp).toDate(),
        symptoms: List<String>.from(doc.data()['symptoms'] ?? []),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!; // Get the localized strings

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            loc.symptomHistoryTitle,), // <-- Localized
        backgroundColor: Colors.deepPurple[200],
      ),
      body: FutureBuilder<List<SymptomLog>>(
        future: _historyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(loc.symptomHistoryErrorLoad)); // <-- Localized
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text(loc.symptonHistoryErrorEmpty)); // <-- Localized
          }

          final history = snapshot.data!;

          // --- WRAP ListView.builder with AnimationLimiter ---
          return AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final log = history[index];
                // --- WRAP EACH ITEM ---
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375), // Animation duration
                  child: SlideAnimation( // Slide effect
                    verticalOffset: 50.0,
                    child: FadeInAnimation( // Fade effect
                      child: Card( // Your original list item
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: ListTile(
                          title: Text(
                            DateFormat.yMMMMd(Localizations.localeOf(context).toString()).format(log.date),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(log.symptoms.join(', ')),
                        ),
                      ),
                    ),
                  ),
                );
                // --- END ITEM WRAPPER ---
              },
            ),
          );
          // --- END AnimationLimiter WRAPPER ---
        },
      ),
    );
  }
}