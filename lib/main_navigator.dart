// --- main_navigator.dart ---

import 'package:flutter/material.dart';
import 'contraction_timer_screen.dart';
import 'home_screen.dart';
import 'hospital_bag_screen.dart';
import 'kick_counter_screen.dart';
import 'symptom_tracker_screen.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  // This list must contain all 5 screens in the correct order.
  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    SymptomTrackerScreen(),
    HospitalBagScreen(),
    ContractionTimerScreen(),
    KickCounterScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // This list must contain all 5 icons in the correct order.
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_outlined),
            label: 'Symptoms',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Checklist',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer_outlined),
              label: 'Timer'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_outlined),
            label: 'Kicks',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple[400],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        // This ensures all labels are always visible.
      ),
    );
  }
}