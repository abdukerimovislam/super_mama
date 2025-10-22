// --- week_page_widget.dart (Corrected) ---

import 'package:flutter/material.dart';
import 'package:super_mama/pregnancy_data.dart';
import 'package:super_mama/week_detail_screen.dart';
import 'l10n/app_localizations.dart'; // Import localizations

class WeekPageWidget extends StatelessWidget {
  final int weekNumber;
  final AppLocalizations loc; // The widget receives the localizations object

  const WeekPageWidget({super.key, required this.weekNumber, required this.loc});

  String _getBabySize(int week) {
    switch (week) {
      case 1: case 2: case 3: return loc.babySizeTinyCells;
      case 4: return loc.babySizePoppySeed;
      case 5: return loc.babySizeAppleSeed;
      case 6: return loc.babySizeSweetPea;
      case 7: return loc.babySizeBlueberry;
      case 8: return loc.babySizeRaspberry;
      case 9: return loc.babySizeCherry;
      case 10: return loc.babySizeStrawberry;
      case 11: return loc.babySizeLime;
      case 12: return loc.babySizePlum;
      case 13: return loc.babySizePeach;
      case 14: return loc.babySizeLemon;
      case 15: return loc.babySizeApple;
      case 16: return loc.babySizeAvocado;
      case 17: return loc.babySizePear;
      case 18: return loc.babySizeBellPepper;
      case 19: return loc.babySizeMango;
      case 20: return loc.babySizeBanana;
      case 21: return loc.babySizeCarrot;
      case 22: return loc.babySizeSpaghettiSquash;
      case 23: return loc.babySizeGrapefruit;
      case 24: return loc.babySizeCorn;
      case 25: return loc.babySizeCauliflower;
      case 26: return loc.babySizeLettuce;
      case 27: return loc.babySizeRutabaga;
      case 28: return loc.babySizeEggplant;
      case 29: return loc.babySizeButternutSquash;
      case 30: return loc.babySizeCabbage;
      case 31: return loc.babySizeCoconut;
      case 32: return loc.babySizeJicama;
      case 33: return loc.babySizePineapple;
      case 34: return loc.babySizeCantaloupe;
      case 35: return loc.babySizeHoneydew;
      case 36: return loc.babySizeRomaine;
      case 37: return loc.babySizeSwissChard;
      case 38: return loc.babySizeLeek;
      case 39: return loc.babySizePumpkin;
      case 40: return loc.babySizeWatermelon;
      default: return loc.babySizeReady;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<PregnancyWeek> localizedPregnancyData = getPregnancyData(loc);
    final dataForWeek = localizedPregnancyData.firstWhere(
          (data) => data.weekNumber == weekNumber,
      orElse: () => localizedPregnancyData.first,
    );
    final babySizeText = _getBabySize(weekNumber);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              // --- FIX: Pass 'loc' to the next screen ---
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeekDetailScreen(weekData: dataForWeek, loc: loc)),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  '${loc.homeScreenWeek} $weekNumber',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.deepPurple[800]),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(loc.homeScreenBabySizeOf, style: const TextStyle(fontSize: 18)),
            Text(babySizeText, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            Card(
              margin: const EdgeInsets.only(top: 20.0),
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Colors.deepPurple[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  dataForWeek.babyDevelopment,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple[700], height: 1.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}