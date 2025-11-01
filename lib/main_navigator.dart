// --- main_navigator.dart (Corrected) ---

import 'package:flutter/material.dart';
import 'package:bloom_mama/contraction_timer_screen.dart';
import 'package:bloom_mama/home_screen.dart';
import 'package:bloom_mama/hospital_bag_screen.dart';
import 'package:bloom_mama/kick_counter_screen.dart';
import 'package:bloom_mama/symptom_tracker_screen.dart';
import 'package:bloom_mama/uncommon_symptoms_screen.dart';
import 'package:bloom_mama/journal_screen.dart';
import 'l10n/app_localizations.dart';
import 'tools_hub_screen.dart';


class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  // This list contains all 6 screens for your navigation bar.
  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    JournalScreen(),
    SymptomTrackerScreen(),
    UncommonSymptomsScreen(),
    HospitalBagScreen(),
    ToolsHubScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the localized strings for the current language
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300), // Duration of the fade
        transitionBuilder: (Widget child, Animation<double> animation) {
          // Use FadeTransition for the effect
          return FadeTransition(opacity: animation, child: child);
        },
        // The child is the currently selected screen
        // The key ensures AnimatedSwitcher recognizes when the child changes
        child: KeyedSubtree(
          key: ValueKey<int>(_selectedIndex), // Use index as the key
          child: _screens.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // This list contains all 6 icons for your navigation bar.
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: loc.navHome,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.edit_note_outlined),
            activeIcon: const Icon(Icons.edit_note),
            label: loc.navJournal,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_hospital_outlined),
            activeIcon: const Icon(Icons.local_hospital), // Added missing active icon
            label: loc.navSymptoms,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.help_outline),
            activeIcon: const Icon(Icons.help),
            label: loc.navNormal,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            activeIcon: const Icon(Icons.shopping_bag), // Added missing active icon
            label: loc.navChecklist,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.timer_outlined),
            activeIcon: const Icon(Icons.timer),
            label: loc.navTimers,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[400],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        // This is essential for good UI when you have more than 3 items.
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}