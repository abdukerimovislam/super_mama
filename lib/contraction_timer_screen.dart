// --- contraction_timer_screen.dart (Corrected) ---

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/app_localizations.dart'; // Import localizations

class Contraction {
  final DateTime startTime;
  final DateTime endTime;

  Contraction({required this.startTime, required this.endTime});

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
        _contractionStartTime = DateTime.now();
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (mounted) {
            setState(() => _secondsElapsed++);
          }
        });
      } else {
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

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(d.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(d.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
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
        title: Text(loc.contractionTimerTitle), // <-- Localized
        backgroundColor: Colors.deepPurple[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetTimer,
            tooltip: loc.contractionTimerResetTooltip, // <-- Localized
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
                      _isTiming ? loc.contractionTimerStop : loc.contractionTimerStart, // <-- Localized
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _contractions.isEmpty
                ? Center(child: Text(loc.contractionTimerEmptyState)) // <-- Localized
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
                  title: Text(loc.contractionTimerDuration(_formatDuration(contraction.duration))), // <-- Localized
                  subtitle: Text(loc.contractionTimerFrequency(frequency)), // <-- Localized
                  trailing: Text(DateFormat.jm(Localizations.localeOf(context).toString()).format(contraction.startTime)), // <-- Locale-aware time
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}