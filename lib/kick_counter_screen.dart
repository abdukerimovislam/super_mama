// --- kick_counter_screen.dart ---

import 'dart:async'; // We need this for the Timer
import 'package:flutter/material.dart';

class KickCounterScreen extends StatefulWidget {
  const KickCounterScreen({super.key});

  @override
  State<KickCounterScreen> createState() => _KickCounterScreenState();
}

class _KickCounterScreenState extends State<KickCounterScreen> {
  // --- STATE VARIABLES ---
  int _kickCount = 0;
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer; // The '?' means it can be null
  String _elapsedTime = '00:00:00';
  bool _isCounting = false;

  // --- LOGIC FUNCTIONS ---
  void _startStopwatch() {
    setState(() {
      _isCounting = true;
    });
    _stopwatch.start();
    // This timer updates the UI every second to show the elapsed time.
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime = _formatTime(_stopwatch.elapsed);
      });
    });
  }

  void _stopStopwatch() {
    setState(() {
      _isCounting = false;
    });
    _stopwatch.stop();
    _timer?.cancel(); // Stop the timer from running
  }

  void _resetCounter() {
    _stopStopwatch();
    _stopwatch.reset();
    setState(() {
      _kickCount = 0;
      _elapsedTime = '00:00:00';
    });
  }

  void _recordKick() {
    if (!_isCounting) {
      _startStopwatch();
    }
    setState(() {
      _kickCount++;
    });

    if (_kickCount == 10) {
      _stopStopwatch();
      // Show a confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Goal Reached!'),
            content: Text('You counted 10 kicks in $_elapsedTime.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  // Helper function to format the time nicely
  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  // This is called when the screen is closed, to prevent memory leaks.
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // --- UI (BUILD METHOD) ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kick Counter'),
        backgroundColor: Colors.deepPurple[200],
        actions: [
          // Add a reset button to the app bar
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetCounter,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Tap the button below each time you feel a kick.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Text(
                '$_kickCount',
                style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              Text(
                _kickCount == 1 ? 'kick' : 'kicks',
                style: const TextStyle(fontSize: 24, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                'Time: $_elapsedTime',
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 50),
              // This is our main button
              SizedBox(
                width: double.infinity, // Make button take full width
                height: 60,
                child: ElevatedButton(
                  onPressed: _recordKick,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Record Kick',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}