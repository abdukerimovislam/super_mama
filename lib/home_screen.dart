// --- home_screen.dart (Fully Localized with Background Image) ---

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:super_mama/settings_screen.dart';
import 'package:super_mama/week_page_widget.dart';
import 'package:super_mama/l10n/app_localizations.dart'; // Import the localizations

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _lmpDate;
  int? _currentWeek;
  bool _isLoading = true;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _loadLMPFromFirebase();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadLMPFromFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }
    try {
      final doc = await FirebaseFirestore.instance.collection('user_data').doc(user.uid).get();
      if (doc.exists && doc.data()?['last_period_date'] != null) {
        final savedDate = (doc.data()!['last_period_date'] as Timestamp).toDate();
        if (mounted) {
          setState(() {
            _lmpDate = savedDate;
            // No need to call update here, it will be called in build
          });
        }
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _saveLMPToFirebase(DateTime date) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    await FirebaseFirestore.instance.collection('user_data').doc(user.uid).set({
      'last_period_date': Timestamp.fromDate(date),
    }, SetOptions(merge: true));
  }

  void _updateAndAnimate(DateTime lmpDate, {bool isInitialLoad = false}) {
    final today = DateTime.now();
    final daysPregnant = today.difference(lmpDate).inDays;
    final week = (daysPregnant / 7).floor() + 1;

    if (week >= 1 && week <= 42) {
      _currentWeek = week;
      if (_pageController.hasClients) {
        if (isInitialLoad) {
          _pageController.jumpToPage(_currentWeek! - 1);
        } else {
          _pageController.animateToPage(
            _currentWeek! - 1,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          );
        }
      }
    }
  }

  void _goToCurrentWeek() {
    if (_currentWeek != null && _pageController.hasClients) {
      _pageController.animateToPage(
        _currentWeek! - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _selectLMP(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _lmpDate ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 300)),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _lmpDate = picked;
        _updateAndAnimate(picked);
      });
      await _saveLMPToFirebase(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    if (_lmpDate != null) {
      _updateAndAnimate(_lmpDate!, isInitialLoad: !_pageController.hasClients || (_pageController.positions.isNotEmpty && _pageController.page == 0));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(loc.appName),
            const SizedBox(width: 8),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.pinkAccent, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: const Icon(Icons.local_florist, color: Colors.white, size: 28),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: loc.settingsTitle,
            onPressed: () => Navigator.of(context).push(FadePageRoute(child: const SettingsScreen())), // Assuming FadePageRoute exists
          ),
        ],
      ),
      // Apply the background image using a Container
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_main.jpg"), // Ensure this path is correct
            fit: BoxFit.cover,
            // Optional: Adjust opacity
            // colorFilter: ColorFilter.mode(
            //   Colors.white.withOpacity(0.8),
            //   BlendMode.dstATop,
            // ),
          ),
        ),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column( // This Column is now the child of the Container
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 40,
                itemBuilder: (context, index) {
                  final weekNumber = index + 1;
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = (_pageController.page! - index).abs();
                        value = (1 - (value * 0.25)).clamp(0.0, 1.0);
                      }
                      return Center(
                        child: SizedBox(
                          height: Curves.easeInOut.transform(value) * 500,
                          child: child,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: WeekPageWidget(weekNumber: weekNumber, loc: loc),
                    ),
                  );
                },
              ),
            ),
            Padding( // Button Section
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              child: _lmpDate == null
                  ? ElevatedButton(
                onPressed: () => _selectLMP(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  elevation: 2,
                  side: BorderSide(color: Colors.deepPurple.shade100),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(loc.homeScreenSetLMP),
              )
                  : Column(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.my_location),
                    label: Text(loc.homeScreenGoToMyWeek(_currentWeek ?? 0)),
                    onPressed: _goToCurrentWeek,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[400],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectLMP(context),
                    child: Text(loc.homeScreenChangeDate),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// You need to ensure the FadePageRoute class exists in your project
class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  FadePageRoute({required this.child})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, page) {
      return FadeTransition(opacity: animation, child: page);
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}