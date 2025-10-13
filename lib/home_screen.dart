import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'week_detail_screen.dart';
import 'pregnancy_data.dart';
import 'kick_counter_screen.dart';
import 'hospital_bag_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // --- STATE VARIABLES ---
  DateTime? _lmpDate; // <-- CHANGED: We now store the Last Menstrual Period date
  DateTime? _estimatedDueDate; // <-- NEW: We will calculate and store the due date
  int? _currentWeek;
  String? _babySize;

  // --- LOGIC FUNCTIONS ---

  // REWRITTEN FUNCTION: This is now much simpler!
  void _updatePregnancyInfo(DateTime lmpDate) {
    final today = DateTime.now();

    // Step 1: Calculate the days passed since the LMP.
    final daysPregnant = today.difference(lmpDate).inDays;

    if (daysPregnant >= 0) {
      // Step 2: Convert days to weeks.
      final week = (daysPregnant / 7).floor() + 1;

      // We'll cap it at 42 weeks.
      if (week > 42) {
        _currentWeek = null;
        _babySize = "Welcome, Baby!";
      } else {
        _currentWeek = week;
        _babySize = _getBabySize(week);
      }

      // Step 3: Calculate the Estimated Due Date (LMP + 280 days).
      _estimatedDueDate = lmpDate.add(const Duration(days: 280));

    } else {
      // This happens if the user picks a future date for their LMP.
      _currentWeek = null;
      _babySize = "Please select a past date.";
      _estimatedDueDate = null;
    }
  }

  // This function is perfect, no changes needed.
  String _getBabySize(int week) {
    switch (week) {
      case 4: return "a poppy seed";
      case 5: return "an apple seed";
      case 6: return "a sweet pea";
      case 7: return "a blueberry";
      case 8: return "a raspberry";
      case 9: return "a cherry";
      case 10: return "a prune";
      case 11: return "a lime";
      case 12: return "a plum";
      case 13: return "a peach";
      case 14: return "a lemon";
      default: return "growing wonderfully";
    }
  }

  // --- INTERACTION FUNCTION ---

  // RENAMED & UPDATED: This function now selects the LMP.
  Future<void> _selectLMP(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _lmpDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 300)), // Allow picking up to ~10 months ago
      lastDate: DateTime.now(), // The LMP cannot be in the future
    );

    if (picked != null) {
      setState(() {
        _lmpDate = picked;
        _updatePregnancyInfo(_lmpDate!); // Call our new logic
      });
    }
  }

  // --- UI (BUILD METHOD) ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloom Mama'),
        backgroundColor: Colors.deepPurple[200],
        actions: [ // <-- ADD THIS SECTION
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // This section for displaying the week is still perfect.
                GestureDetector(
                  // NEW onTap
                  onTap: () {
                    if (_currentWeek != null) {
                      // Find the week data in our list that matches the current week.
                      final dataForWeek = pregnancyData.firstWhere(
                            (week) => week.weekNumber == _currentWeek,
                        // If no data is found for that week, do nothing.
                        orElse: () => pregnancyData.first, // Fallback, can be improved
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // Pass the entire data object to the detail screen.
                          builder: (context) => WeekDetailScreen(weekData: dataForWeek),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Week ${_currentWeek ?? '--'}',
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _babySize == null ? 'Select the first day of your last period' : 'Your baby is the size of',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${_babySize ?? '...'}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 40),

                // --- UPDATED INFO CARDS ---
                // --- PASTE THIS NEW CODE ---

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column( // We use a Column to stack the two date rows
                    children: [
                      // Row 1: Last Period Date
                      Row(
                        children: <Widget>[
                          const Icon(Icons.event_note, color: Colors.deepPurple, size: 30),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Last Period Date', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  _lmpDate == null
                                      ? 'Not set yet'
                                      : DateFormat('MMMM d, yyyy').format(_lmpDate!),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      // A nice visual divider between the two rows
                      const Divider(height: 20, thickness: 1),

                      // Row 2: Estimated Due Date
                      Row(
                        children: <Widget>[
                          const Icon(Icons.calendar_today, color: Colors.deepPurple, size: 30),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Estimated Due Date', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  _estimatedDueDate == null
                                      ? '---'
                                      : DateFormat('MMMM d, yyyy').format(_estimatedDueDate!),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
// --- END OF NEW CODE ---

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () => _selectLMP(context), // <-- Call our renamed function
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple[400]),
                  child: const Text('Set Last Period Date'), // <-- Updated button text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}