// --- hospital_bag_screen.dart ---

import 'package:flutter/material.dart';

// This is our blueprint for a single checklist item.
class ChecklistItem {
  String title;
  bool isChecked;

  ChecklistItem({required this.title, this.isChecked = false});
}

class HospitalBagScreen extends StatefulWidget {
  const HospitalBagScreen({super.key});

  @override
  State<HospitalBagScreen> createState() => _HospitalBagScreenState();
}

class _HospitalBagScreenState extends State<HospitalBagScreen> {
  // This is our list of items. We'll pre-populate it with common suggestions.
  final List<ChecklistItem> _items = [
    ChecklistItem(title: 'ID and Insurance Card'),
    ChecklistItem(title: 'Birth Plan (if you have one)'),
    ChecklistItem(title: 'Phone and Charger (extra long cord!)'),
    ChecklistItem(title: 'Comfortable Robe or Gown'),
    ChecklistItem(title: 'Slippers and Non-skid Socks'),
    ChecklistItem(title: 'Nursing Bra and Pads'),
    ChecklistItem(title: 'Going-home Outfit for Mom'),
    ChecklistItem(title: 'Lip Balm and Toiletries'),
    ChecklistItem(title: 'Snacks and Drinks'),
    ChecklistItem(title: 'Going-home Outfit for Baby'),
    ChecklistItem(title: 'Installed Car Seat'),
    ChecklistItem(title: 'Pillow from Home'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Bag Checklist'),
        backgroundColor: Colors.deepPurple[200],
      ),
      // ListView.builder is the best way to display a long, scrollable list.
      // It's very efficient because it only builds the items that are visible on screen.
      body: ListView.builder(
        // The number of items in our list.
        itemCount: _items.length,
        // The function that builds each item in the list.
        itemBuilder: (context, index) {
          final item = _items[index];
          // CheckboxListTile is a perfect, pre-built widget for our needs.
          return CheckboxListTile(
            title: Text(
              item.title,
              style: TextStyle(
                decoration: item.isChecked
                    ? TextDecoration.lineThrough // Add a strikethrough if checked
                    : TextDecoration.none,
              ),
            ),
            value: item.isChecked,
            // This function is called when the user taps the checkbox.
            onChanged: (bool? value) {
              setState(() {
                // We update the state of the specific item that was tapped.
                item.isChecked = value!;
              });
            },
          );
        },
      ),
    );
  }
}