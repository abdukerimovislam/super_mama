// --- week_detail_screen.dart ---

import 'package:flutter/material.dart';
import 'pregnancy_data.dart'; // <-- Import our new data file

class WeekDetailScreen extends StatelessWidget {
  // Instead of just a number, we now expect the whole package of weekly info.
  final PregnancyWeek weekData;

  const WeekDetailScreen({super.key, required this.weekData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Use the data from our object
        title: Text('Week ${weekData.weekNumber} Details'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: SingleChildScrollView( // Allows scrolling if content is too long
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's happening in Week ${weekData.weekNumber}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            const Text(
              "Baby's Development:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Use the real data from our object!
            Text(
              weekData.babyDevelopment,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Mom's Symptoms:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Use the real data from our object!
            Text(
              weekData.momSymptoms,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}