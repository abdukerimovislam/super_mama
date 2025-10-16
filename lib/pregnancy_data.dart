// --- pregnancy_data.dart ---
import 'l10n/app_localizations.dart';
// This is our blueprint for weekly information.
class PregnancyWeek {
  final int weekNumber;
  final String babyDevelopment;
  final String momSymptoms;

  // This is a "constructor" to create a new week's info.
  const PregnancyWeek({
    required this.weekNumber,
    required this.babyDevelopment,
    required this.momSymptoms,
  });
}

List<PregnancyWeek> getPregnancyData(AppLocalizations loc) {
  return [
    PregnancyWeek(weekNumber: 1, babyDevelopment: loc.week1Dev, momSymptoms: loc.week1Mom),
    PregnancyWeek(weekNumber: 2, babyDevelopment: loc.week2Dev, momSymptoms: loc.week2Mom),
    PregnancyWeek(weekNumber: 3, babyDevelopment: loc.week3Dev, momSymptoms: loc.week3Mom),
    PregnancyWeek(weekNumber: 4, babyDevelopment: loc.week4Dev, momSymptoms: loc.week4Mom),
    PregnancyWeek(weekNumber: 5, babyDevelopment: loc.week5Dev, momSymptoms: loc.week5Mom),
    PregnancyWeek(weekNumber: 6, babyDevelopment: loc.week6Dev, momSymptoms: loc.week6Mom),
    PregnancyWeek(weekNumber: 7, babyDevelopment: loc.week7Dev, momSymptoms: loc.week7Mom),
    PregnancyWeek(weekNumber: 8, babyDevelopment: loc.week8Dev, momSymptoms: loc.week8Mom),
    PregnancyWeek(weekNumber: 9, babyDevelopment: loc.week9Dev, momSymptoms: loc.week9Mom),
    PregnancyWeek(weekNumber: 10, babyDevelopment: loc.week10Dev, momSymptoms: loc.week10Mom),
    PregnancyWeek(weekNumber: 11, babyDevelopment: loc.week11Dev, momSymptoms: loc.week11Mom),
    PregnancyWeek(weekNumber: 12, babyDevelopment: loc.week12Dev, momSymptoms: loc.week12Mom),
    PregnancyWeek(weekNumber: 13, babyDevelopment: loc.week13Dev, momSymptoms: loc.week13Mom),
    PregnancyWeek(weekNumber: 14, babyDevelopment: loc.week14Dev, momSymptoms: loc.week14Mom),
    PregnancyWeek(weekNumber: 15, babyDevelopment: loc.week15Dev, momSymptoms: loc.week15Mom),
    PregnancyWeek(weekNumber: 16, babyDevelopment: loc.week16Dev, momSymptoms: loc.week16Mom),
    PregnancyWeek(weekNumber: 17, babyDevelopment: loc.week17Dev, momSymptoms: loc.week17Mom),
    PregnancyWeek(weekNumber: 18, babyDevelopment: loc.week18Dev, momSymptoms: loc.week18Mom),
    PregnancyWeek(weekNumber: 19, babyDevelopment: loc.week19Dev, momSymptoms: loc.week19Mom),
    PregnancyWeek(weekNumber: 20, babyDevelopment: loc.week20Dev, momSymptoms: loc.week20Mom),
    PregnancyWeek(weekNumber: 21, babyDevelopment: loc.week21Dev, momSymptoms: loc.week21Mom),
    PregnancyWeek(weekNumber: 22, babyDevelopment: loc.week22Dev, momSymptoms: loc.week22Mom),
    PregnancyWeek(weekNumber: 23, babyDevelopment: loc.week23Dev, momSymptoms: loc.week23Mom),
    PregnancyWeek(weekNumber: 24, babyDevelopment: loc.week24Dev, momSymptoms: loc.week24Mom),
    PregnancyWeek(weekNumber: 25, babyDevelopment: loc.week25Dev, momSymptoms: loc.week25Mom),
    PregnancyWeek(weekNumber: 26, babyDevelopment: loc.week26Dev, momSymptoms: loc.week26Mom),
    PregnancyWeek(weekNumber: 27, babyDevelopment: loc.week27Dev, momSymptoms: loc.week27Mom),
    PregnancyWeek(weekNumber: 28, babyDevelopment: loc.week28Dev, momSymptoms: loc.week28Mom),
    PregnancyWeek(weekNumber: 29, babyDevelopment: loc.week29Dev, momSymptoms: loc.week29Mom),
    PregnancyWeek(weekNumber: 30, babyDevelopment: loc.week30Dev, momSymptoms: loc.week30Mom),
    PregnancyWeek(weekNumber: 31, babyDevelopment: loc.week31Dev, momSymptoms: loc.week31Mom),
    PregnancyWeek(weekNumber: 32, babyDevelopment: loc.week32Dev, momSymptoms: loc.week32Mom),
    PregnancyWeek(weekNumber: 33, babyDevelopment: loc.week33Dev, momSymptoms: loc.week33Mom),
    PregnancyWeek(weekNumber: 34, babyDevelopment: loc.week34Dev, momSymptoms: loc.week34Mom),
    PregnancyWeek(weekNumber: 35, babyDevelopment: loc.week35Dev, momSymptoms: loc.week35Mom),
    PregnancyWeek(weekNumber: 36, babyDevelopment: loc.week36Dev, momSymptoms: loc.week36Mom),
    PregnancyWeek(weekNumber: 37, babyDevelopment: loc.week37Dev, momSymptoms: loc.week37Mom),
    PregnancyWeek(weekNumber: 38, babyDevelopment: loc.week38Dev, momSymptoms: loc.week38Mom),
    PregnancyWeek(weekNumber: 39, babyDevelopment: loc.week39Dev, momSymptoms: loc.week39Mom),
    PregnancyWeek(weekNumber: 40, babyDevelopment: loc.week40Dev, momSymptoms: loc.week40Mom),
    PregnancyWeek(weekNumber: 41, babyDevelopment: loc.week41Dev, momSymptoms: loc.week41Mom),
    PregnancyWeek(weekNumber: 42, babyDevelopment: loc.week42Dev, momSymptoms: loc.week42Mom),
  ];
}