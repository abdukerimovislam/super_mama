// --- symptom_history_screen.dart ---

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

// A simple class to hold the data for a single day's log
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
  // We'll use a FutureBuilder to handle loading and displaying the data
  late final Future<List<SymptomLog>> _historyFuture;

  @override
  void initState() {
    super.initState();
    _historyFuture = _fetchHistory();
  }

  // Fetches the history from the Firestore subcollection
  Future<List<SymptomLog>> _fetchHistory() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return [];

    final snapshot = await FirebaseFirestore.instance
        .collection('user_data')
        .doc(user.uid)
        .collection('symptom_history')
        .orderBy('date', descending: true) // Show the most recent logs first
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom History'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: FutureBuilder<List<SymptomLog>>(
        future: _historyFuture,
        builder: (context, snapshot) {
          // While waiting for data, show a loading spinner
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // If there's an error
          if (snapshot.hasError) {
            return const Center(child: Text('Failed to load history.'));
          }
          // If there's no data
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No symptom history found.'));
          }

          final history = snapshot.data!;

          // Display the data in a ListView
          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final log = history[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(
                    DateFormat('MMMM d, yyyy').format(log.date), // e.g., "October 13, 2025"
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(log.symptoms.join(', ')), // e.g., "Nausea, Fatigue"
                ),
              );
            },
          );
        },
      ),
    );
  }
}