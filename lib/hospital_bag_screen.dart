// --- hospital_bag_screen.dart ---

import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart'; // Import the generated localizations

// This class is unchanged
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
  // We declare the list here, but we will initialize it later
  List<ChecklistItem> _items = [];
  bool _isInitialized = false;

  // We use didChangeDependencies to safely access the context and AppLocalizations
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // This ensures the list is only initialized once
    if (!_isInitialized) {
      // Get the localized strings
      final loc = AppLocalizations.of(context)!;
      // Initialize the list using the localized strings
      _items = [
        ChecklistItem(title: loc.checklistItemID),
        ChecklistItem(title: loc.checklistItemBirthPlan),
        ChecklistItem(title: loc.checklistItemPhone),
        ChecklistItem(title: loc.checklistItemRobe),
        ChecklistItem(title: loc.checklistItemSlippers),
        ChecklistItem(title: loc.checklistItemNursingBra),
        ChecklistItem(title: loc.checklistItemOutfitMom),
        ChecklistItem(title: loc.checklistItemToiletries),
        ChecklistItem(title: loc.checklistItemSnacks),
        ChecklistItem(title: loc.checklistItemOutfitBaby),
        ChecklistItem(title: loc.checklistItemCarSeat),
        ChecklistItem(title: loc.checklistItemPillow),
      ];
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Use the localized title
        title: Text(AppLocalizations.of(context)!.checklistTitle),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return CheckboxListTile(
            title: Text(
              item.title,
              style: TextStyle(
                decoration: item.isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            value: item.isChecked,
            onChanged: (bool? value) {
              setState(() {
                item.isChecked = value ?? false;
              });
            },
          );
        },
      ),
    );
  }
}