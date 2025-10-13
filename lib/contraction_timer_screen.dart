// --- contraction_timer_screen.dart (Corrected) ---

import 'dart:async';
import 'package:flutter/material.dart';

// A simple class to hold the data for a single contraction
class Contraction {
  final DateTime startTime;
  final DateTime endTime;

  Contraction({required this.startTime, required this.endTime});

  // A calculated property to get the duration
  Duration get duration => endTime.difference(startTime);
}

class ContractionTimerScreen extends StatefulWidget {
  const ContractionTimerScreen({super.key});

  @override
  State<ContractionTimerScreen> createState() => _ContractionTimerScreenState();
}

class _ContractionTimerScreenState extends State<ContractionTimerScreen> {
  final List<Contraction> _contractions = [];
  Timer? _timer;
  DateTime? _contractionStartTime;
  int _secondsElapsed = 0;
  bool _isTiming = false;

  void _toggleTimer() {
    setState(() {
      _isTiming = !_isTiming;
      if (_isTiming) {
        // Start of a new contraction
        _contractionStartTime = DateTime.now();
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (mounted) { // Check if the widget is still in the tree
            setState(() {
              _secondsElapsed++;
            });
          }
        });
      } else {
        // End of the contraction
        _timer?.cancel();
        if (_contractionStartTime != null) {
          _contractions.insert(0, Contraction(
            startTime: _contractionStartTime!,
            endTime: DateTime.now(),
          ));
        }
        _contractionStartTime = null;
        _secondsElapsed = 0;
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _timer?.cancel();
      _contractions.clear();
      _contractionStartTime = null;
      _secondsElapsed = 0;
      _isTiming = false;
    });
  }

  // Helper function to format duration as MM:SS
  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  // Helper function to format time as H:MM AM/PM
  String _formatTime(DateTime dt) {
    final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contraction Timer'),
        backgroundColor: Colors.deepPurple[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetTimer,
            tooltip: 'Reset',
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple[50],
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text(
                  _formatDuration(Duration(seconds: _secondsElapsed)),
                  style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.deepPurple, fontFamily: 'monospace'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _toggleTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isTiming ? Colors.red[400] : Colors.green[400],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      _isTiming ? 'Stop Contraction' : 'Start Contraction',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _contractions.isEmpty
                ? const Center(child: Text('Start timing your first contraction.'))
                : ListView.builder(
              itemCount: _contractions.length,
              itemBuilder: (context, index) {
                final contraction = _contractions[index];
                String frequency = '---';

                if (index < _contractions.length - 1) {
                  final previousContraction = _contractions[index + 1];
                  final freqDuration = contraction.startTime.difference(previousContraction.startTime);
                  frequency = _formatDuration(freqDuration);
                }

                return ListTile(
                  leading: CircleAvatar(child: Text('${_contractions.length - index}')),
                  title: Text('Duration: ${_formatDuration(contraction.duration)}'),
                  subtitle: Text('Frequency: $frequency'),
                  trailing: Text(_formatTime(contraction.startTime)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}