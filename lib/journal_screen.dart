// --- journal_screen.dart ---

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloom_mama/journal_history_screen.dart';
import 'l10n/app_localizations.dart'; // Import the localizations

class Mood {
  final String name;
  final IconData icon;

  const Mood({required this.name, required this.icon});
}

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _textController = TextEditingController();
  bool _isSaving = false;
  List<Mood> _moods = [];
  bool _isInitialized = false;
  Mood? _selectedMood;

  // We initialize the moods list here to access the context
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final loc = AppLocalizations.of(context)!;
      _moods = [
        Mood(name: loc.journalMoodHappy, icon: Icons.sentiment_very_satisfied),
        Mood(name: loc.journalMoodGrateful, icon: Icons.favorite),
        Mood(name: loc.journalMoodTired, icon: Icons.battery_alert),
        Mood(name: loc.journalMoodAnxious, icon: Icons.sentiment_neutral),
        Mood(name: loc.journalMoodSad, icon: Icons.sentiment_very_dissatisfied),
      ];
      _isInitialized = true;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _saveJournalEntry() async {
    final loc = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    if (_textController.text.isEmpty && _selectedMood == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.journalErrorEmpty)), // <-- Localized
      );
      return;
    }

    setState(() => _isSaving = true);

    final today = DateTime.now();
    final formattedDate = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

    try {
      await FirebaseFirestore.instance
          .collection('user_data')
          .doc(user.uid)
          .collection('journal_entries')
          .doc(formattedDate)
          .set({
        'entry': _textController.text,
        'mood': _selectedMood?.name,
        'date': Timestamp.fromDate(today),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.journalSuccessSave)), // <-- Localized
      );
      _textController.clear();
      setState(() {
        _selectedMood = null;
      });

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.journalErrorSave(e.toString()))), // <-- Localized
      );
    } finally {
      if(mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(loc.journalTitle), // <-- Localized
        backgroundColor: Colors.deepPurple[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book_outlined),
            tooltip: loc.journalHistoryTitle, // <-- Localized
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const JournalHistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.journalGreeting, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), // <-- Localized
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _moods.map((mood) {
                final isSelected = _selectedMood?.name == mood.name;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedMood = mood;
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: isSelected ? Colors.deepPurple[100] : Colors.grey[200],
                        child: Icon(mood.icon, size: 35, color: isSelected ? Colors.white : Colors.deepPurple),
                      ),
                      const SizedBox(height: 8),
                      Text(mood.name), // This is already localized from the list
                    ],
                  ),
                );
              }).toList(),
            ),
            const Divider(height: 40),
            Text(loc.journalTodaysThoughts, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // <-- Localized
            const SizedBox(height: 10),
            TextField(
              controller: _textController,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: loc.journalHintText, // <-- Localized
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _saveJournalEntry,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple[400]),
                child: _isSaving
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(loc.journalSave, style: const TextStyle(fontSize: 18)), // <-- Localized
              ),
            ),
          ],
        ),
      ),
    );
  }
}