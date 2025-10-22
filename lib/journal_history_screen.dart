// --- journal_history_screen.dart ---

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'l10n/app_localizations.dart'; // Import the localizations
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class JournalHistoryScreen extends StatelessWidget {
  const JournalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final loc = AppLocalizations.of(context)!; // Get the localized strings

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.journalHistoryTitle), // <-- Localized
        backgroundColor: Colors.deepPurple[200],
      ),
      body: user == null
          ? Center(child: Text(loc.journalHistoryErrorLogin)) // <-- Localized
          : StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('user_data')
            .doc(user.uid)
            .collection('journal_entries')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text(loc.journalHistoryErrorEmpty)); // <-- Localized
          }

          final entries = snapshot.data!.docs;

          // --- WRAP ListView.builder with AnimationLimiter ---
          return AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final data = entries[index].data() as Map<String, dynamic>;
                final date = (data['date'] as Timestamp).toDate();
                final entryText = data['entry'] as String?;
                final moodName = data['mood'] as String?;

                // --- WRAP EACH ITEM ---
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375), // Animation duration
                  child: SlideAnimation( // Slide effect
                    verticalOffset: 50.0,
                    child: FadeInAnimation( // Fade effect
                      child: Card( // Your original list item
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat.yMMMMd(Localizations.localeOf(context).toString()).format(date),
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const Divider(height: 20),
                              if (moodName != null)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                      loc.journalHistoryMood(moodName),
                                      style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)
                                  ),
                                ),
                              if (entryText != null && entryText.isNotEmpty)
                                Text(
                                  entryText,
                                  style: const TextStyle(height: 1.5, fontSize: 15),
                                ),
                            ],
                          ),
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