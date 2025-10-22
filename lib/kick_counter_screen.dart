// --- kick_counter_screen.dart ---

import 'dart:async';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart'; // Import the localizations

class KickCounterScreen extends StatefulWidget {
  const KickCounterScreen({super.key});

  @override
  State<KickCounterScreen> createState() => _KickCounterScreenState();
}

class _KickCounterScreenState extends State<KickCounterScreen> {
  int _kickCount = 0;
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  String _elapsedTime = '00:00:00';
  bool _isCounting = false;

  void _startStopwatch() {
    setState(() => _isCounting = true);
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() => _elapsedTime = _formatTime(_stopwatch.elapsed));
      }
    });
  }

  void _stopStopwatch() {
    setState(() => _isCounting = false);
    _stopwatch.stop();
    _timer?.cancel();
  }

  void _resetCounter() {
    _stopStopwatch();
    _stopwatch.reset();
    if (mounted) {
      setState(() {
        _kickCount = 0;
        _elapsedTime = '00:00:00';
      });
    }
  }

  void _recordKick() {
    if (!_isCounting) {
      _startStopwatch();
    }
    setState(() => _kickCount++);

    if (_kickCount == 10) {
      _stopStopwatch();
      final loc = AppLocalizations.of(context)!; // Get localizations for the dialog
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(loc.kickCounterGoalReached), // <-- Localized
            content: Text(loc.kickCounterGoalMessage(_elapsedTime)), // <-- Localized with variable
            actions: <Widget>[
              TextButton(
                child: Text(loc.ok), // <-- Localized
                onPressed: () => Navigator.of(dialogContext).pop(),
              ),
            ],
          );
        },
      );
    }
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(loc.kickCounterTitle), // <-- Localized
        backgroundColor: Colors.deepPurple[200],
        actions: [
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
              Text(
                loc.kickCounterInstructions, // <-- Localized
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Text(
                '$_kickCount',
                style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              Text(
                loc.kickCounterKicks(_kickCount), // <-- Localized plural
                style: const TextStyle(fontSize: 24, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                loc.kickCounterTime(_elapsedTime), // <-- Localized with variable
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _recordKick,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    loc.kickCounterRecordKick, // <-- Localized
                    style: const TextStyle(fontSize: 20),
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