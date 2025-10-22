import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('ru'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Bloom Mama'**
  String get appName;

  /// No description provided for @signInWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Bloom Mama'**
  String get signInWelcome;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navJournal.
  ///
  /// In en, this message translates to:
  /// **'Journal'**
  String get navJournal;

  /// No description provided for @navSymptoms.
  ///
  /// In en, this message translates to:
  /// **'Symptoms'**
  String get navSymptoms;

  /// No description provided for @navNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal?'**
  String get navNormal;

  /// No description provided for @navChecklist.
  ///
  /// In en, this message translates to:
  /// **'Checklist'**
  String get navChecklist;

  /// No description provided for @navTimers.
  ///
  /// In en, this message translates to:
  /// **'Timers'**
  String get navTimers;

  /// No description provided for @homeScreenWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get homeScreenWeek;

  /// No description provided for @homeScreenBabySizeOf.
  ///
  /// In en, this message translates to:
  /// **'Your baby is the size of'**
  String get homeScreenBabySizeOf;

  /// No description provided for @homeScreenSetLMP.
  ///
  /// In en, this message translates to:
  /// **'Set Last Period Date'**
  String get homeScreenSetLMP;

  /// No description provided for @homeScreenGoToMyWeek.
  ///
  /// In en, this message translates to:
  /// **'Go to My Current Week (Week {weekNumber})'**
  String homeScreenGoToMyWeek(int weekNumber);

  /// No description provided for @homeScreenChangeDate.
  ///
  /// In en, this message translates to:
  /// **'Change Date'**
  String get homeScreenChangeDate;

  /// No description provided for @dailyDigestTitle.
  ///
  /// In en, this message translates to:
  /// **'✨ Daily Digest'**
  String get dailyDigestTitle;

  /// No description provided for @dailyDigestTip.
  ///
  /// In en, this message translates to:
  /// **'Tip'**
  String get dailyDigestTip;

  /// No description provided for @dailyDigestAffirmation.
  ///
  /// In en, this message translates to:
  /// **'Affirmation'**
  String get dailyDigestAffirmation;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsDailyAffirmations.
  ///
  /// In en, this message translates to:
  /// **'Daily Affirmations'**
  String get settingsDailyAffirmations;

  /// No description provided for @settingsDailyAffirmationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive a positive message twice a day.'**
  String get settingsDailyAffirmationsSubtitle;

  /// No description provided for @settingsLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get settingsLogOut;

  /// No description provided for @settingsLogOutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Log Out'**
  String get settingsLogOutConfirmTitle;

  /// No description provided for @settingsLogOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get settingsLogOutConfirm;

  /// No description provided for @settingsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settingsCancel;

  /// No description provided for @symptomTrackerTitle.
  ///
  /// In en, this message translates to:
  /// **'Symptom Tracker'**
  String get symptomTrackerTitle;

  /// No description provided for @symptomTrackerGreeting.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get symptomTrackerGreeting;

  /// No description provided for @symptomTrackerSave.
  ///
  /// In en, this message translates to:
  /// **'Save Today\'s Symptoms'**
  String get symptomTrackerSave;

  /// No description provided for @symptomHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Symptom History'**
  String get symptomHistoryTitle;

  /// No description provided for @symptomCatCommon.
  ///
  /// In en, this message translates to:
  /// **'Common Discomforts'**
  String get symptomCatCommon;

  /// No description provided for @symptomCatBody.
  ///
  /// In en, this message translates to:
  /// **'Body Changes'**
  String get symptomCatBody;

  /// No description provided for @symptomCatMood.
  ///
  /// In en, this message translates to:
  /// **'Mood & Cravings'**
  String get symptomCatMood;

  /// No description provided for @isItNormalTitle.
  ///
  /// In en, this message translates to:
  /// **'Is It Normal?'**
  String get isItNormalTitle;

  /// No description provided for @checklistTitle.
  ///
  /// In en, this message translates to:
  /// **'Hospital Bag Checklist'**
  String get checklistTitle;

  /// No description provided for @checklistItemID.
  ///
  /// In en, this message translates to:
  /// **'ID and Insurance Card'**
  String get checklistItemID;

  /// No description provided for @checklistItemBirthPlan.
  ///
  /// In en, this message translates to:
  /// **'Birth Plan (if you have one)'**
  String get checklistItemBirthPlan;

  /// No description provided for @checklistItemPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone and Charger (extra long cord!)'**
  String get checklistItemPhone;

  /// No description provided for @checklistItemRobe.
  ///
  /// In en, this message translates to:
  /// **'Comfortable Robe or Gown'**
  String get checklistItemRobe;

  /// No description provided for @checklistItemSlippers.
  ///
  /// In en, this message translates to:
  /// **'Slippers and Non-skid Socks'**
  String get checklistItemSlippers;

  /// No description provided for @checklistItemNursingBra.
  ///
  /// In en, this message translates to:
  /// **'Nursing Bra and Pads'**
  String get checklistItemNursingBra;

  /// No description provided for @checklistItemOutfitMom.
  ///
  /// In en, this message translates to:
  /// **'Going-home Outfit for Mom'**
  String get checklistItemOutfitMom;

  /// No description provided for @checklistItemToiletries.
  ///
  /// In en, this message translates to:
  /// **'Lip Balm and Toiletries'**
  String get checklistItemToiletries;

  /// No description provided for @checklistItemSnacks.
  ///
  /// In en, this message translates to:
  /// **'Snacks and Drinks'**
  String get checklistItemSnacks;

  /// No description provided for @checklistItemOutfitBaby.
  ///
  /// In en, this message translates to:
  /// **'Going-home Outfit for Baby'**
  String get checklistItemOutfitBaby;

  /// No description provided for @checklistItemCarSeat.
  ///
  /// In en, this message translates to:
  /// **'Installed Car Seat'**
  String get checklistItemCarSeat;

  /// No description provided for @checklistItemPillow.
  ///
  /// In en, this message translates to:
  /// **'Pillow from Home'**
  String get checklistItemPillow;

  /// No description provided for @timersHubTitle.
  ///
  /// In en, this message translates to:
  /// **'Timers'**
  String get timersHubTitle;

  /// No description provided for @timersContractionTitle.
  ///
  /// In en, this message translates to:
  /// **'Contraction Timer'**
  String get timersContractionTitle;

  /// No description provided for @timersContractionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Time contractions and track their frequency.'**
  String get timersContractionSubtitle;

  /// No description provided for @timersKickTitle.
  ///
  /// In en, this message translates to:
  /// **'Kick Counter'**
  String get timersKickTitle;

  /// No description provided for @timersKickSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your baby\'s kicks to ensure they are active.'**
  String get timersKickSubtitle;

  /// No description provided for @journalTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Journal'**
  String get journalTitle;

  /// No description provided for @journalGreeting.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get journalGreeting;

  /// No description provided for @journalTodaysThoughts.
  ///
  /// In en, this message translates to:
  /// **'Today\'s thoughts:'**
  String get journalTodaysThoughts;

  /// No description provided for @journalHintText.
  ///
  /// In en, this message translates to:
  /// **'Write about your day, your feelings, or any special moments...'**
  String get journalHintText;

  /// No description provided for @journalSave.
  ///
  /// In en, this message translates to:
  /// **'Save Entry'**
  String get journalSave;

  /// No description provided for @journalHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Journal History'**
  String get journalHistoryTitle;

  /// No description provided for @notificationMorningTitle.
  ///
  /// In en, this message translates to:
  /// **'☀️ Good Morning, Mama!'**
  String get notificationMorningTitle;

  /// No description provided for @notificationEveningTitle.
  ///
  /// In en, this message translates to:
  /// **'🌙 Good Evening, Mama!'**
  String get notificationEveningTitle;

  /// No description provided for @tip1.
  ///
  /// In en, this message translates to:
  /// **'Stay hydrated! Aim for 8-10 glasses of water a day to support your body and your growing baby.'**
  String get tip1;

  /// No description provided for @tip2.
  ///
  /// In en, this message translates to:
  /// **'Even a 15-minute walk can boost your mood and energy. Listen to your body and don\'t overdo it.'**
  String get tip2;

  /// No description provided for @tip3.
  ///
  /// In en, this message translates to:
  /// **'Folic acid is crucial for baby\'s neural tube development. Ensure your prenatal vitamin has at least 400 mcg.'**
  String get tip3;

  /// No description provided for @tip4.
  ///
  /// In en, this message translates to:
  /// **'Morning sickness can strike anytime. Try keeping plain crackers by your bed to eat before getting up.'**
  String get tip4;

  /// No description provided for @tip5.
  ///
  /// In en, this message translates to:
  /// **'Your body is working hard. Don\'t feel guilty about taking a nap if you feel tired.'**
  String get tip5;

  /// No description provided for @tip6.
  ///
  /// In en, this message translates to:
  /// **'Add more fiber to your diet with fruits, veggies, and whole grains to help prevent constipation.'**
  String get tip6;

  /// No description provided for @tip7.
  ///
  /// In en, this message translates to:
  /// **'Talk to your baby! They can start to hear your voice this trimester, and it\'s a great way to bond.'**
  String get tip7;

  /// No description provided for @tip8.
  ///
  /// In en, this message translates to:
  /// **'Start a simple pregnancy journal. Write down your thoughts, feelings, and milestones.'**
  String get tip8;

  /// No description provided for @tip9.
  ///
  /// In en, this message translates to:
  /// **'Your skin is more sensitive to the sun now. Remember to wear sunscreen, even on cloudy days.'**
  String get tip9;

  /// No description provided for @tip10.
  ///
  /// In en, this message translates to:
  /// **'Are you getting enough calcium? Dairy, leafy greens, and fortified foods help build baby\'s bones.'**
  String get tip10;

  /// No description provided for @tip11.
  ///
  /// In en, this message translates to:
  /// **'Practice Kegel exercises daily to strengthen your pelvic floor for delivery and postpartum recovery.'**
  String get tip11;

  /// No description provided for @tip12.
  ///
  /// In en, this message translates to:
  /// **'Struggling with heartburn? Try eating smaller, more frequent meals throughout the day.'**
  String get tip12;

  /// No description provided for @tip13.
  ///
  /// In en, this message translates to:
  /// **'A warm (not hot!) bath can be a wonderful way to soothe sore muscles and relax.'**
  String get tip13;

  /// No description provided for @tip14.
  ///
  /// In en, this message translates to:
  /// **'Start moisturizing your belly, hips, and thighs to help with stretching skin and reduce itchiness.'**
  String get tip14;

  /// No description provided for @tip15.
  ///
  /// In en, this message translates to:
  /// **'Feeling moody? It\'s the hormones. Be kind to yourself and communicate your feelings to your partner.'**
  String get tip15;

  /// No description provided for @tip16.
  ///
  /// In en, this message translates to:
  /// **'Make a list of questions to ask your doctor at your next appointment so you don\'t forget.'**
  String get tip16;

  /// No description provided for @tip17.
  ///
  /// In en, this message translates to:
  /// **'Practice deep breathing exercises. It\'s a powerful tool for managing stress now and pain during labor.'**
  String get tip17;

  /// No description provided for @tip18.
  ///
  /// In en, this message translates to:
  /// **'Elevate your feet at the end of the day to help reduce swelling in your ankles.'**
  String get tip18;

  /// No description provided for @tip19.
  ///
  /// In en, this message translates to:
  /// **'Wear comfortable, supportive shoes. Your center of gravity is shifting!'**
  String get tip19;

  /// No description provided for @tip20.
  ///
  /// In en, this message translates to:
  /// **'Cravings are normal! Indulge in moderation, but focus on a balanced diet overall.'**
  String get tip20;

  /// No description provided for @tip21.
  ///
  /// In en, this message translates to:
  /// **'Pack a healthy snack in your bag, like nuts or a granola bar, to avoid getting overly hungry.'**
  String get tip21;

  /// No description provided for @tip22.
  ///
  /// In en, this message translates to:
  /// **'Start a gentle stretching routine in the morning to ease stiffness and improve circulation.'**
  String get tip22;

  /// No description provided for @tip23.
  ///
  /// In en, this message translates to:
  /// **'Feeling anxious? It\'s okay. Share your worries with someone you trust, like your partner or a close friend.'**
  String get tip23;

  /// No description provided for @tip24.
  ///
  /// In en, this message translates to:
  /// **'Review your health insurance to understand your maternity coverage and hospital options.'**
  String get tip24;

  /// No description provided for @tip25.
  ///
  /// In en, this message translates to:
  /// **'Take a weekly \'bumpie\' photo to track your beautiful progress!'**
  String get tip25;

  /// No description provided for @tip26.
  ///
  /// In en, this message translates to:
  /// **'Sleep on your left side to improve blood flow to the placenta and your baby.'**
  String get tip26;

  /// No description provided for @tip27.
  ///
  /// In en, this message translates to:
  /// **'Read a chapter of a pregnancy or parenting book each day to feel more prepared.'**
  String get tip27;

  /// No description provided for @tip28.
  ///
  /// In en, this message translates to:
  /// **'If you can\'t sleep, don\'t just lie there. Get up, read a book, or listen to calming music until you feel sleepy again.'**
  String get tip28;

  /// No description provided for @tip29.
  ///
  /// In en, this message translates to:
  /// **'Involve your partner in the journey. Have them talk to the baby or feel the kicks.'**
  String get tip29;

  /// No description provided for @tip30.
  ///
  /// In en, this message translates to:
  /// **'As you get closer to your due date, finalize your hospital bag. It\'s better to be prepared early!'**
  String get tip30;

  /// No description provided for @affirmation1.
  ///
  /// In en, this message translates to:
  /// **'I am creating a miracle within me.'**
  String get affirmation1;

  /// No description provided for @affirmation2.
  ///
  /// In en, this message translates to:
  /// **'My body is strong and capable.'**
  String get affirmation2;

  /// No description provided for @affirmation3.
  ///
  /// In en, this message translates to:
  /// **'I trust my body\'s wisdom to grow my baby.'**
  String get affirmation3;

  /// No description provided for @affirmation4.
  ///
  /// In en, this message translates to:
  /// **'I am calm, relaxed, and at peace.'**
  String get affirmation4;

  /// No description provided for @affirmation5.
  ///
  /// In en, this message translates to:
  /// **'Each day brings me closer to meeting my baby.'**
  String get affirmation5;

  /// No description provided for @affirmation6.
  ///
  /// In en, this message translates to:
  /// **'I am embracing the changes in my body with love.'**
  String get affirmation6;

  /// No description provided for @affirmation7.
  ///
  /// In en, this message translates to:
  /// **'I am a wonderful mother.'**
  String get affirmation7;

  /// No description provided for @affirmation8.
  ///
  /// In en, this message translates to:
  /// **'I am creating a safe and loving home for my child.'**
  String get affirmation8;

  /// No description provided for @affirmation9.
  ///
  /// In en, this message translates to:
  /// **'I am grateful for this incredible journey.'**
  String get affirmation9;

  /// No description provided for @affirmation10.
  ///
  /// In en, this message translates to:
  /// **'I am strong, confident, and empowered.'**
  String get affirmation10;

  /// No description provided for @affirmation11.
  ///
  /// In en, this message translates to:
  /// **'I release all fear and welcome love.'**
  String get affirmation11;

  /// No description provided for @affirmation12.
  ///
  /// In en, this message translates to:
  /// **'My baby feels my peace and joy.'**
  String get affirmation12;

  /// No description provided for @affirmation13.
  ///
  /// In en, this message translates to:
  /// **'I am nourishing myself and my baby with every choice I make.'**
  String get affirmation13;

  /// No description provided for @affirmation14.
  ///
  /// In en, this message translates to:
  /// **'I am beautifully pregnant.'**
  String get affirmation14;

  /// No description provided for @affirmation15.
  ///
  /// In en, this message translates to:
  /// **'I am prepared for a positive birth experience.'**
  String get affirmation15;

  /// No description provided for @affirmation16.
  ///
  /// In en, this message translates to:
  /// **'I am patient and trust the timing of my journey.'**
  String get affirmation16;

  /// No description provided for @affirmation17.
  ///
  /// In en, this message translates to:
  /// **'My body knows exactly what to do.'**
  String get affirmation17;

  /// No description provided for @affirmation18.
  ///
  /// In en, this message translates to:
  /// **'I am surrounded by love and support.'**
  String get affirmation18;

  /// No description provided for @affirmation19.
  ///
  /// In en, this message translates to:
  /// **'I am doing a great job, and that is enough.'**
  String get affirmation19;

  /// No description provided for @affirmation20.
  ///
  /// In en, this message translates to:
  /// **'My strength is greater than any discomfort.'**
  String get affirmation20;

  /// No description provided for @affirmation21.
  ///
  /// In en, this message translates to:
  /// **'I choose to focus on joy and gratitude today.'**
  String get affirmation21;

  /// No description provided for @affirmation22.
  ///
  /// In en, this message translates to:
  /// **'I am deeply connected to my baby.'**
  String get affirmation22;

  /// No description provided for @affirmation23.
  ///
  /// In en, this message translates to:
  /// **'Every kick and flutter is a reminder of the life I am creating.'**
  String get affirmation23;

  /// No description provided for @affirmation24.
  ///
  /// In en, this message translates to:
  /// **'I am a source of love and life.'**
  String get affirmation24;

  /// No description provided for @affirmation25.
  ///
  /// In en, this message translates to:
  /// **'I am exactly where I need to be right now.'**
  String get affirmation25;

  /// No description provided for @affirmation26.
  ///
  /// In en, this message translates to:
  /// **'I am worthy of a beautiful and healthy pregnancy.'**
  String get affirmation26;

  /// No description provided for @affirmation27.
  ///
  /// In en, this message translates to:
  /// **'I am confident in my ability to give birth.'**
  String get affirmation27;

  /// No description provided for @affirmation28.
  ///
  /// In en, this message translates to:
  /// **'My baby and I are healthy, safe, and secure.'**
  String get affirmation28;

  /// No description provided for @affirmation29.
  ///
  /// In en, this message translates to:
  /// **'I am creating life, and it is a masterpiece.'**
  String get affirmation29;

  /// No description provided for @affirmation30.
  ///
  /// In en, this message translates to:
  /// **'Today, I will honor my body, my mind, and my baby.'**
  String get affirmation30;

  /// No description provided for @kickCounterTitle.
  ///
  /// In en, this message translates to:
  /// **'Kick Counter'**
  String get kickCounterTitle;

  /// No description provided for @kickCounterInstructions.
  ///
  /// In en, this message translates to:
  /// **'Tap the button below each time you feel a kick.'**
  String get kickCounterInstructions;

  /// No description provided for @kickCounterRecordKick.
  ///
  /// In en, this message translates to:
  /// **'Record Kick'**
  String get kickCounterRecordKick;

  /// No description provided for @kickCounterTime.
  ///
  /// In en, this message translates to:
  /// **'Time: {time}'**
  String kickCounterTime(String time);

  /// No description provided for @kickCounterKicks.
  ///
  /// In en, this message translates to:
  /// **'{count,plural, =1{kick} other{kicks}}'**
  String kickCounterKicks(int count);

  /// No description provided for @kickCounterGoalReached.
  ///
  /// In en, this message translates to:
  /// **'Goal Reached!'**
  String get kickCounterGoalReached;

  /// No description provided for @kickCounterGoalMessage.
  ///
  /// In en, this message translates to:
  /// **'You counted 10 kicks in {time}.'**
  String kickCounterGoalMessage(String time);

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @notificationChannelName.
  ///
  /// In en, this message translates to:
  /// **'Daily Affirmations'**
  String get notificationChannelName;

  /// No description provided for @notificationChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Provides daily positive affirmations for mothers.'**
  String get notificationChannelDescription;

  /// No description provided for @journalMoodHappy.
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get journalMoodHappy;

  /// No description provided for @journalMoodGrateful.
  ///
  /// In en, this message translates to:
  /// **'Grateful'**
  String get journalMoodGrateful;

  /// No description provided for @journalMoodTired.
  ///
  /// In en, this message translates to:
  /// **'Tired'**
  String get journalMoodTired;

  /// No description provided for @journalMoodAnxious.
  ///
  /// In en, this message translates to:
  /// **'Anxious'**
  String get journalMoodAnxious;

  /// No description provided for @journalMoodSad.
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get journalMoodSad;

  /// No description provided for @journalErrorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please write something or select a mood.'**
  String get journalErrorEmpty;

  /// No description provided for @journalSuccessSave.
  ///
  /// In en, this message translates to:
  /// **'Journal entry saved!'**
  String get journalSuccessSave;

  /// No description provided for @journalErrorSave.
  ///
  /// In en, this message translates to:
  /// **'Failed to save entry: {error}'**
  String journalErrorSave(String error);

  /// No description provided for @journalHistoryErrorLogin.
  ///
  /// In en, this message translates to:
  /// **'You must be logged in to view history.'**
  String get journalHistoryErrorLogin;

  /// No description provided for @journalHistoryErrorEmpty.
  ///
  /// In en, this message translates to:
  /// **'No journal entries yet.'**
  String get journalHistoryErrorEmpty;

  /// No description provided for @journalHistoryMood.
  ///
  /// In en, this message translates to:
  /// **'Mood: {moodName}'**
  String journalHistoryMood(String moodName);

  /// No description provided for @contractionTimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Contraction Timer'**
  String get contractionTimerTitle;

  /// No description provided for @contractionTimerResetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get contractionTimerResetTooltip;

  /// No description provided for @contractionTimerStart.
  ///
  /// In en, this message translates to:
  /// **'Start Contraction'**
  String get contractionTimerStart;

  /// No description provided for @contractionTimerStop.
  ///
  /// In en, this message translates to:
  /// **'Stop Contraction'**
  String get contractionTimerStop;

  /// No description provided for @contractionTimerEmptyState.
  ///
  /// In en, this message translates to:
  /// **'Start timing your first contraction.'**
  String get contractionTimerEmptyState;

  /// No description provided for @contractionTimerDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration: {duration}'**
  String contractionTimerDuration(String duration);

  /// No description provided for @contractionTimerFrequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency: {frequency}'**
  String contractionTimerFrequency(String frequency);

  /// No description provided for @signInError.
  ///
  /// In en, this message translates to:
  /// **'Sign-in failed: {error}'**
  String signInError(String error);

  /// No description provided for @week1Dev.
  ///
  /// In en, this message translates to:
  /// **'This week is counted from the first day of your last period, even though conception has not yet occurred. Your body is preparing for potential pregnancy.'**
  String get week1Dev;

  /// No description provided for @week1Mom.
  ///
  /// In en, this message translates to:
  /// **'You are on your period. Your body is shedding last month\'s uterine lining and preparing a new egg for release.'**
  String get week1Mom;

  /// No description provided for @week2Dev.
  ///
  /// In en, this message translates to:
  /// **'Your ovary is preparing to release an egg (ovulation). Fertilization typically occurs at the end of this week or the beginning of the next.'**
  String get week2Dev;

  /// No description provided for @week2Mom.
  ///
  /// In en, this message translates to:
  /// **'Your body is preparing for ovulation. Some women may experience mild pelvic discomfort or a heightened sense of smell.'**
  String get week2Mom;

  /// No description provided for @week3Dev.
  ///
  /// In en, this message translates to:
  /// **'Fertilization has happened! The fertilized egg, now a blastocyst, travels down the fallopian tube and will soon implant in the uterine wall.'**
  String get week3Dev;

  /// No description provided for @week3Mom.
  ///
  /// In en, this message translates to:
  /// **'You won\'t feel pregnant yet, but a lot is happening on a cellular level. Some women experience light implantation spotting.'**
  String get week3Mom;

  /// No description provided for @week4Dev.
  ///
  /// In en, this message translates to:
  /// **'The blastocyst has implanted in your uterus. It\'s now an embryo, about the size of a poppy seed, and the amniotic sac and placenta are beginning to form.'**
  String get week4Dev;

  /// No description provided for @week4Mom.
  ///
  /// In en, this message translates to:
  /// **'This is when you\'d expect your period. A missed period is the first major sign. You might feel mild cramping or fatigue.'**
  String get week4Mom;

  /// No description provided for @week5Dev.
  ///
  /// In en, this message translates to:
  /// **'The neural tube, which becomes the brain and spinal cord, is forming. The heart is developing and may even start to beat. Baby is the size of an apple seed.'**
  String get week5Dev;

  /// No description provided for @week5Mom.
  ///
  /// In en, this message translates to:
  /// **'Morning sickness may begin. Your breasts might feel tender and swollen, and you\'ll likely feel more tired than usual.'**
  String get week5Mom;

  /// No description provided for @week6Dev.
  ///
  /// In en, this message translates to:
  /// **'Facial features like eyes and nostrils are starting to form. Small buds that will become arms and legs are visible. The heart is beating more regularly.'**
  String get week6Dev;

  /// No description provided for @week6Mom.
  ///
  /// In en, this message translates to:
  /// **'Nausea and food aversions can be strong. Frequent urination is common as your kidneys become more efficient.'**
  String get week6Mom;

  /// No description provided for @week7Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby is doubling in size! Hands and feet are emerging from the developing arms and legs. They are about the size of a blueberry.'**
  String get week7Dev;

  /// No description provided for @week7Mom.
  ///
  /// In en, this message translates to:
  /// **'You might be experiencing mood swings due to hormonal changes. The fatigue and nausea may continue.'**
  String get week7Mom;

  /// No description provided for @week8Dev.
  ///
  /// In en, this message translates to:
  /// **'Fingers and toes are now forming. The lungs are beginning to take shape. The baby is constantly moving, although you can\'t feel it yet.'**
  String get week8Dev;

  /// No description provided for @week8Mom.
  ///
  /// In en, this message translates to:
  /// **'Your uterus is expanding, which might cause some light cramping. Your sense of smell can be incredibly sensitive.'**
  String get week8Mom;

  /// No description provided for @week9Dev.
  ///
  /// In en, this message translates to:
  /// **'All of the baby’s essential organs have begun to form. The tiny tail at the bottom of the spinal cord has disappeared. Baby is the size of a cherry.'**
  String get week9Dev;

  /// No description provided for @week9Mom.
  ///
  /// In en, this message translates to:
  /// **'You might feel exhausted. Hormones are surging, and your body is working hard to grow the placenta.'**
  String get week9Mom;

  /// No description provided for @week10Dev.
  ///
  /// In en, this message translates to:
  /// **'The embryo is now officially a fetus. Fingernails and toenails are starting to form, and the baby can swallow.'**
  String get week10Dev;

  /// No description provided for @week10Mom.
  ///
  /// In en, this message translates to:
  /// **'Your abdomen may be starting to feel firmer. You might notice your veins are more visible due to increased blood volume.'**
  String get week10Mom;

  /// No description provided for @week11Dev.
  ///
  /// In en, this message translates to:
  /// **'The fetus is almost fully formed. They are kicking, stretching, and even hiccuping, but it\'s still too early for you to feel these movements.'**
  String get week11Dev;

  /// No description provided for @week11Mom.
  ///
  /// In en, this message translates to:
  /// **'Nausea may start to subside. Headaches can be common due to hormonal shifts and increased blood volume.'**
  String get week11Mom;

  /// No description provided for @week12Dev.
  ///
  /// In en, this message translates to:
  /// **'Fingerprints are forming on the tiny fingertips. The baby\'s reflexes are developing; if you poke your belly, they\'ll likely squirm in response.'**
  String get week12Dev;

  /// No description provided for @week12Mom.
  ///
  /// In en, this message translates to:
  /// **'The risk of miscarriage drops significantly at the end of this week. Your uterus is starting to rise above the pelvic bone.'**
  String get week12Mom;

  /// No description provided for @week13Dev.
  ///
  /// In en, this message translates to:
  /// **'Vocal cords are developing, and their intestines are moving from the umbilical cord into their abdomen. Baby is about the size of a peach.'**
  String get week13Dev;

  /// No description provided for @week13Mom.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the second trimester! You might be feeling more energetic as early pregnancy fatigue subsides. Your belly is likely starting to show.'**
  String get week13Mom;

  /// No description provided for @week14Dev.
  ///
  /// In en, this message translates to:
  /// **'Baby can now squint, frown, and make facial expressions. Their kidneys are producing urine, which is released into the amniotic fluid.'**
  String get week14Dev;

  /// No description provided for @week14Mom.
  ///
  /// In en, this message translates to:
  /// **'Round ligament pain, a sharp jab in your side, might start as your uterus grows. Your energy levels may be increasing.'**
  String get week14Mom;

  /// No description provided for @week15Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby\'s skeleton is hardening from soft cartilage to bone. You might be able to find out the baby\'s sex via ultrasound this week.'**
  String get week15Dev;

  /// No description provided for @week15Mom.
  ///
  /// In en, this message translates to:
  /// **'You may experience some nasal congestion, known as pregnancy rhinitis, due to hormonal changes.'**
  String get week15Mom;

  /// No description provided for @week16Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby\'s eyes can now move, and they can hear your voice. Their circulatory and urinary systems are fully functional.'**
  String get week16Dev;

  /// No description provided for @week16Mom.
  ///
  /// In en, this message translates to:
  /// **'You might feel the first flutters of movement, called \'quickening.\' It can feel like gas bubbles or a gentle tickle.'**
  String get week16Mom;

  /// No description provided for @week17Dev.
  ///
  /// In en, this message translates to:
  /// **'Fat stores are beginning to develop under the baby\'s skin, which will help regulate their body temperature after birth. Baby is the size of an onion.'**
  String get week17Dev;

  /// No description provided for @week17Mom.
  ///
  /// In en, this message translates to:
  /// **'Your appetite may be increasing. Be mindful of making healthy food choices to support your growing baby.'**
  String get week17Mom;

  /// No description provided for @week18Dev.
  ///
  /// In en, this message translates to:
  /// **'The nervous system is maturing rapidly. A protective coating called myelin is forming around the nerves.'**
  String get week18Dev;

  /// No description provided for @week18Mom.
  ///
  /// In en, this message translates to:
  /// **'You may have trouble sleeping comfortably. Try sleeping on your side with pillows for support. You may also feel dizzy at times.'**
  String get week18Mom;

  /// No description provided for @week19Dev.
  ///
  /// In en, this message translates to:
  /// **'A waxy, protective coating called vernix caseosa is forming on the baby\'s skin to protect it from the amniotic fluid.'**
  String get week19Dev;

  /// No description provided for @week19Mom.
  ///
  /// In en, this message translates to:
  /// **'Your skin might be changing. Some women develop dark patches called melasma or a dark line down their abdomen called the linea nigra.'**
  String get week19Mom;

  /// No description provided for @week20Dev.
  ///
  /// In en, this message translates to:
  /// **'Halfway there! You can likely feel your baby\'s movements more distinctly now. They are swallowing more, which is good practice for their digestive system.'**
  String get week20Dev;

  /// No description provided for @week20Mom.
  ///
  /// In en, this message translates to:
  /// **'Your anatomy scan ultrasound is usually scheduled around this time. Your belly button might pop out.'**
  String get week20Mom;

  /// No description provided for @week21Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby\'s eyebrows and eyelids are now present. Their kicks and jabs are becoming stronger and more frequent.'**
  String get week21Dev;

  /// No description provided for @week21Mom.
  ///
  /// In en, this message translates to:
  /// **'Leg cramps, especially at night, can become common. Make sure you\'re staying hydrated and stretching.'**
  String get week21Mom;

  /// No description provided for @week22Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby now looks like a miniature newborn. Their lips, teeth buds, and eyes are more developed. They are about the size of a papaya.'**
  String get week22Dev;

  /// No description provided for @week22Mom.
  ///
  /// In en, this message translates to:
  /// **'Your feet might swell. Putting your feet up can help. Stretch marks may start to appear on your abdomen, breasts, or thighs.'**
  String get week22Mom;

  /// No description provided for @week23Dev.
  ///
  /// In en, this message translates to:
  /// **'The sense of hearing is improving. The baby can hear sounds from the outside world, like your voice or music, more clearly.'**
  String get week23Dev;

  /// No description provided for @week23Mom.
  ///
  /// In en, this message translates to:
  /// **'You might experience Braxton Hicks contractions, which are \'practice\' contractions that feel like a tightening of the abdomen.'**
  String get week23Mom;

  /// No description provided for @week24Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby\'s lungs are developing branches of the respiratory \'tree\' as well as cells that produce surfactant, a substance that will help them breathe at birth.'**
  String get week24Dev;

  /// No description provided for @week24Mom.
  ///
  /// In en, this message translates to:
  /// **'Your doctor will likely test you for gestational diabetes between now and 28 weeks. Your skin may feel itchy as it stretches.'**
  String get week24Mom;

  /// No description provided for @week25Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby is practicing breathing by inhaling and exhaling amniotic fluid. Their hair is growing and may have color and texture.'**
  String get week25Dev;

  /// No description provided for @week25Mom.
  ///
  /// In en, this message translates to:
  /// **'Backaches are very common as your center of gravity shifts and your growing belly puts a strain on your back muscles.'**
  String get week25Mom;

  /// No description provided for @week26Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby\'s eyes are starting to open and can detect light. Their sleep-wake cycles are becoming more established.'**
  String get week26Dev;

  /// No description provided for @week26Mom.
  ///
  /// In en, this message translates to:
  /// **'You might find yourself feeling more forgetful, often called \'pregnancy brain.\' It\'s normal and temporary!'**
  String get week26Mom;

  /// No description provided for @week27Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby\'s brain is very active now. Their lungs are still maturing but could function with medical assistance if they were born now.'**
  String get week27Dev;

  /// No description provided for @week27Mom.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the third trimester! You might feel more tired again as the baby gets bigger. Heartburn is a common complaint.'**
  String get week27Mom;

  /// No description provided for @week28Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby is gaining weight rapidly, adding layers of fat. They can blink their eyes, which now have eyelashes.'**
  String get week28Dev;

  /// No description provided for @week28Mom.
  ///
  /// In en, this message translates to:
  /// **'Your doctor\'s appointments will likely become more frequent. Restless leg syndrome can be an issue for some women at night.'**
  String get week28Mom;

  /// No description provided for @week29Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby\'s bones are fully developed but still soft and pliable. Their kicks are strong and visible from the outside.'**
  String get week29Dev;

  /// No description provided for @week29Mom.
  ///
  /// In en, this message translates to:
  /// **'Constipation and hemorrhoids can be a problem due to hormones and pressure from the uterus. Increase your fiber and water intake.'**
  String get week29Mom;

  /// No description provided for @week30Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby can now regulate their own body temperature. Their head is growing to make room for the developing brain. Baby is the size of a large cabbage.'**
  String get week30Dev;

  /// No description provided for @week30Mom.
  ///
  /// In en, this message translates to:
  /// **'You may feel short of breath as your uterus presses up against your diaphragm. Your sleep may be frequently interrupted.'**
  String get week30Mom;

  /// No description provided for @week31Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby is practicing all five senses. They are processing information, tracking light, and tasting what you eat through the amniotic fluid.'**
  String get week31Dev;

  /// No description provided for @week31Mom.
  ///
  /// In en, this message translates to:
  /// **'You might notice a yellowish fluid, colostrum, leaking from your breasts. This is your baby\'s first milk.'**
  String get week31Mom;

  /// No description provided for @week32Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby has likely settled into a head-down position in preparation for birth. The toenails have finished growing.'**
  String get week32Dev;

  /// No description provided for @week32Mom.
  ///
  /// In en, this message translates to:
  /// **'Braxton Hicks contractions might be getting stronger and more frequent. You\'re in the home stretch!'**
  String get week32Mom;

  /// No description provided for @week33Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby\'s skull is still soft, which allows it to move through the birth canal more easily. Their immune system is getting a boost from you.'**
  String get week33Dev;

  /// No description provided for @week33Mom.
  ///
  /// In en, this message translates to:
  /// **'It can be hard to find a comfortable position for anything – sitting, standing, or sleeping. The pressure on your bladder is intense.'**
  String get week33Mom;

  /// No description provided for @week34Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby\'s central nervous system is maturing, and the lungs are well-developed. The protective vernix coating on their skin is getting thicker.'**
  String get week34Dev;

  /// No description provided for @week34Mom.
  ///
  /// In en, this message translates to:
  /// **'Your vision might be a bit blurry due to fluid retention. This should resolve after you give birth.'**
  String get week34Mom;

  /// No description provided for @week35Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby doesn\'t have much room to move around anymore, so the movements might feel more like rolling and squirming than sharp kicks.'**
  String get week35Dev;

  /// No description provided for @week35Mom.
  ///
  /// In en, this message translates to:
  /// **'You\'ll likely have a Group B Strep test this week. Your doctor will be checking for signs of labor at your appointments.'**
  String get week35Mom;

  /// No description provided for @week36Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby is considered \'early term.\' They are shedding most of the fine hair (lanugo) and waxy coating (vernix) that covered their skin.'**
  String get week36Dev;

  /// No description provided for @week36Mom.
  ///
  /// In en, this message translates to:
  /// **'You might feel the baby \'drop\' into your pelvis, a process called lightening. This can relieve pressure on your lungs but increase it on your bladder.'**
  String get week36Mom;

  /// No description provided for @week37Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby is now considered \'full term\'! They are practicing breathing movements, and their grasp is firm.'**
  String get week37Dev;

  /// No description provided for @week37Mom.
  ///
  /// In en, this message translates to:
  /// **'You might be feeling a mix of excitement, anxiety, and impatience. Look out for signs of labor like regular contractions or your water breaking.'**
  String get week37Mom;

  /// No description provided for @week38Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby has a full head of hair, and their brain and lungs will continue to mature until birth. They are gaining about half a pound per week.'**
  String get week38Dev;

  /// No description provided for @week38Mom.
  ///
  /// In en, this message translates to:
  /// **'You may have a lot of vaginal discharge and lose your mucus plug. Your body is preparing for the big day!'**
  String get week38Mom;

  /// No description provided for @week39Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby is ready to meet you! Their brain is still developing at an incredible pace. They are plump and ready for life outside the womb.'**
  String get week39Dev;

  /// No description provided for @week39Mom.
  ///
  /// In en, this message translates to:
  /// **'Try to rest as much as you can. It\'s a waiting game now! Walking and staying gently active can help encourage labor to start.'**
  String get week39Mom;

  /// No description provided for @week40Dev.
  ///
  /// In en, this message translates to:
  /// **'Happy due date! Remember that only about 5% of babies are born on their due date. Your baby is fully mature and waiting for the signal to be born.'**
  String get week40Dev;

  /// No description provided for @week40Mom.
  ///
  /// In en, this message translates to:
  /// **'You might feel a lot of pelvic pressure and discomfort. Call your doctor if you think you are in labor or if your water breaks.'**
  String get week40Mom;

  /// No description provided for @week41Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby is now \'late term.\' They continue to grow, and their nails and hair may be quite long at birth.'**
  String get week41Dev;

  /// No description provided for @week41Mom.
  ///
  /// In en, this message translates to:
  /// **'Your doctor may discuss options for inducing labor. You will be monitored closely to ensure the baby is still doing well.'**
  String get week41Mom;

  /// No description provided for @week42Dev.
  ///
  /// In en, this message translates to:
  /// **'The baby is \'post-term.\' The risks are slightly higher, so induction is very likely if you haven\'t gone into labor naturally.'**
  String get week42Dev;

  /// No description provided for @week42Mom.
  ///
  /// In en, this message translates to:
  /// **'It can be emotionally draining to go past your due date. Trust your body and your medical team. You will meet your baby very soon!'**
  String get week42Mom;

  /// No description provided for @settingsUserFallbackName.
  ///
  /// In en, this message translates to:
  /// **'Bloom Mama User'**
  String get settingsUserFallbackName;

  /// No description provided for @settingsUserFallbackEmail.
  ///
  /// In en, this message translates to:
  /// **'No email associated'**
  String get settingsUserFallbackEmail;

  /// No description provided for @settingsAffirmationsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Daily affirmations enabled!'**
  String get settingsAffirmationsEnabled;

  /// No description provided for @settingsAffirmationsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Daily affirmations disabled.'**
  String get settingsAffirmationsDisabled;

  /// No description provided for @symptomHistoryErrorLoad.
  ///
  /// In en, this message translates to:
  /// **'Failed to load history.'**
  String get symptomHistoryErrorLoad;

  /// No description provided for @symptonHistoryErrorEmpty.
  ///
  /// In en, this message translates to:
  /// **'No symptom history found.'**
  String get symptonHistoryErrorEmpty;

  /// No description provided for @symptomHistoryTooltip.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get symptomHistoryTooltip;

  /// No description provided for @symptomErrorLoad.
  ///
  /// In en, this message translates to:
  /// **'Could not load today\'s symptoms.'**
  String get symptomErrorLoad;

  /// No description provided for @symptomSuccessSave.
  ///
  /// In en, this message translates to:
  /// **'Symptoms for today saved!'**
  String get symptomSuccessSave;

  /// No description provided for @symptomErrorSave.
  ///
  /// In en, this message translates to:
  /// **'Failed to save symptoms: {error}'**
  String symptomErrorSave(String error);

  /// No description provided for @symptomDialogWhatToDo.
  ///
  /// In en, this message translates to:
  /// **'What you can do:'**
  String get symptomDialogWhatToDo;

  /// No description provided for @symptomDialogCheckbox.
  ///
  /// In en, this message translates to:
  /// **'I\'m experiencing this'**
  String get symptomDialogCheckbox;

  /// No description provided for @symptomDialogClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get symptomDialogClose;

  /// No description provided for @symptomNauseaDef.
  ///
  /// In en, this message translates to:
  /// **'A feeling of sickness, often called \'morning sickness\' but can occur anytime.'**
  String get symptomNauseaDef;

  /// No description provided for @symptomNauseaAdv.
  ///
  /// In en, this message translates to:
  /// **'Try eating small, frequent meals. Ginger tea or candies can help. Stay hydrated.'**
  String get symptomNauseaAdv;

  /// No description provided for @symptomFatigueDef.
  ///
  /// In en, this message translates to:
  /// **'An overwhelming feeling of tiredness and lack of energy.'**
  String get symptomFatigueDef;

  /// No description provided for @symptomFatigueAdv.
  ///
  /// In en, this message translates to:
  /// **'Listen to your body and rest when you can. Gentle exercise like walking can boost energy.'**
  String get symptomFatigueAdv;

  /// No description provided for @symptomHeadacheDef.
  ///
  /// In en, this message translates to:
  /// **'Pain or discomfort in the head, often caused by hormonal shifts or dehydration.'**
  String get symptomHeadacheDef;

  /// No description provided for @symptomHeadacheAdv.
  ///
  /// In en, this message translates to:
  /// **'Rest in a quiet, dark room. Apply a cool compress. Consult your doctor before taking any medication.'**
  String get symptomHeadacheAdv;

  /// No description provided for @symptomHeartburnDef.
  ///
  /// In en, this message translates to:
  /// **'A burning sensation in the chest, caused by stomach acid flowing back up.'**
  String get symptomHeartburnDef;

  /// No description provided for @symptomHeartburnAdv.
  ///
  /// In en, this message translates to:
  /// **'Eat smaller meals. Avoid spicy, greasy, or acidic foods. Don\'t lie down immediately after eating.'**
  String get symptomHeartburnAdv;

  /// No description provided for @symptomConstipationDef.
  ///
  /// In en, this message translates to:
  /// **'Difficulty passing stools, caused by hormonal changes slowing down digestion.'**
  String get symptomConstipationDef;

  /// No description provided for @symptomConstipationAdv.
  ///
  /// In en, this message translates to:
  /// **'Increase your fiber intake with fruits, vegetables, and whole grains. Drink plenty of water and stay active.'**
  String get symptomConstipationAdv;

  /// No description provided for @symptomBackPainDef.
  ///
  /// In en, this message translates to:
  /// **'Aches and pains in the lower back due to weight gain and a shifting center of gravity.'**
  String get symptomBackPainDef;

  /// No description provided for @symptomBackPainAdv.
  ///
  /// In en, this message translates to:
  /// **'Practice good posture. Use a supportive chair. A warm bath or prenatal massage may provide relief.'**
  String get symptomBackPainAdv;

  /// No description provided for @symptomSwellingDef.
  ///
  /// In en, this message translates to:
  /// **'Mild swelling (edema) in the ankles, feet, and hands, caused by fluid retention.'**
  String get symptomSwellingDef;

  /// No description provided for @symptomSwellingAdv.
  ///
  /// In en, this message translates to:
  /// **'Elevate your feet whenever possible. Avoid standing for long periods. Wear comfortable shoes.'**
  String get symptomSwellingAdv;

  /// No description provided for @symptomCrampsDef.
  ///
  /// In en, this message translates to:
  /// **'Mild, period-like cramping in the lower abdomen, often due to the uterus expanding.'**
  String get symptomCrampsDef;

  /// No description provided for @symptomCrampsAdv.
  ///
  /// In en, this message translates to:
  /// **'Change positions, rest, or take a warm bath. If cramping is severe, contact your doctor immediately.'**
  String get symptomCrampsAdv;

  /// No description provided for @symptomSkinChangesDef.
  ///
  /// In en, this message translates to:
  /// **'Changes like acne, dark patches (melasma), or the \'linea nigra\' on your belly.'**
  String get symptomSkinChangesDef;

  /// No description provided for @symptomSkinChangesAdv.
  ///
  /// In en, this message translates to:
  /// **'Use gentle, oil-free skincare products. Always wear sunscreen, as your skin is more sensitive. Most changes fade after pregnancy.'**
  String get symptomSkinChangesAdv;

  /// No description provided for @symptomCravingsDef.
  ///
  /// In en, this message translates to:
  /// **'A strong, sudden desire to eat a particular type of food.'**
  String get symptomCravingsDef;

  /// No description provided for @symptomCravingsAdv.
  ///
  /// In en, this message translates to:
  /// **'It\'s okay to indulge in moderation, but try to find healthier alternatives if possible.'**
  String get symptomCravingsAdv;

  /// No description provided for @symptomMoodSwingsDef.
  ///
  /// In en, this message translates to:
  /// **'Rapidly changing emotions, from happy to sad or irritable, due to hormonal fluctuations.'**
  String get symptomMoodSwingsDef;

  /// No description provided for @symptomMoodSwingsAdv.
  ///
  /// In en, this message translates to:
  /// **'Get plenty of rest, eat well, and exercise. Talk about your feelings with your partner or a friend. It\'s okay to not be okay!'**
  String get symptomMoodSwingsAdv;

  /// No description provided for @symptomAnxietyDef.
  ///
  /// In en, this message translates to:
  /// **'Feelings of worry, nervousness, or unease about the pregnancy, birth, or parenthood.'**
  String get symptomAnxietyDef;

  /// No description provided for @symptomAnxietyAdv.
  ///
  /// In en, this message translates to:
  /// **'Practice mindfulness or prenatal meditation. Join a support group. Discuss your fears with your healthcare provider.'**
  String get symptomAnxietyAdv;

  /// No description provided for @symptomNausea.
  ///
  /// In en, this message translates to:
  /// **'Nausea'**
  String get symptomNausea;

  /// No description provided for @symptomFatigue.
  ///
  /// In en, this message translates to:
  /// **'Fatigue'**
  String get symptomFatigue;

  /// No description provided for @symptomHeadache.
  ///
  /// In en, this message translates to:
  /// **'Headache'**
  String get symptomHeadache;

  /// No description provided for @symptomHeartburn.
  ///
  /// In en, this message translates to:
  /// **'Heartburn'**
  String get symptomHeartburn;

  /// No description provided for @symptomConstipation.
  ///
  /// In en, this message translates to:
  /// **'Constipation'**
  String get symptomConstipation;

  /// No description provided for @symptomBackPain.
  ///
  /// In en, this message translates to:
  /// **'Back Pain'**
  String get symptomBackPain;

  /// No description provided for @symptomSwelling.
  ///
  /// In en, this message translates to:
  /// **'Swelling'**
  String get symptomSwelling;

  /// No description provided for @symptomCramps.
  ///
  /// In en, this message translates to:
  /// **'Cramps'**
  String get symptomCramps;

  /// No description provided for @symptomSkinChanges.
  ///
  /// In en, this message translates to:
  /// **'Skin Changes'**
  String get symptomSkinChanges;

  /// No description provided for @symptomCravings.
  ///
  /// In en, this message translates to:
  /// **'Cravings'**
  String get symptomCravings;

  /// No description provided for @symptomMoodSwings.
  ///
  /// In en, this message translates to:
  /// **'Mood Swings'**
  String get symptomMoodSwings;

  /// No description provided for @symptomAnxiety.
  ///
  /// In en, this message translates to:
  /// **'Anxiety'**
  String get symptomAnxiety;

  /// No description provided for @uncommonSymptomDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Symptom Details'**
  String get uncommonSymptomDetailTitle;

  /// No description provided for @uncommonSymptomIsItNormal.
  ///
  /// In en, this message translates to:
  /// **'Is It Normal?'**
  String get uncommonSymptomIsItNormal;

  /// No description provided for @uncommonSymptom1Title.
  ///
  /// In en, this message translates to:
  /// **'Metallic Taste in Mouth?'**
  String get uncommonSymptom1Title;

  /// No description provided for @uncommonSymptom1Desc.
  ///
  /// In en, this message translates to:
  /// **'Some women report a sour or metallic taste in their mouth during the first trimester, even when not eating. This is known as dysgeusia.'**
  String get uncommonSymptom1Desc;

  /// No description provided for @uncommonSymptom1Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, this is surprisingly normal! It\'s believed to be caused by the surge in pregnancy hormones, particularly estrogen. It usually fades by the second trimester. Brushing your tongue, chewing sugar-free gum, or rinsing with a mild saltwater solution can help.'**
  String get uncommonSymptom1Normal;

  /// No description provided for @uncommonSymptom2Title.
  ///
  /// In en, this message translates to:
  /// **'Suddenly Snoring?'**
  String get uncommonSymptom2Title;

  /// No description provided for @uncommonSymptom2Desc.
  ///
  /// In en, this message translates to:
  /// **'Even if you\'ve never snored before, you might start during pregnancy. This is often due to increased blood flow causing the mucous membranes in your nose to swell.'**
  String get uncommonSymptom2Desc;

  /// No description provided for @uncommonSymptom2Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, it\'s normal (though perhaps annoying for your partner!). Try sleeping on your side and using a humidifier in your room. If it\'s severe or you\'re gasping for air, mention it to your doctor to rule out sleep apnea.'**
  String get uncommonSymptom2Normal;

  /// No description provided for @uncommonSymptom3Title.
  ///
  /// In en, this message translates to:
  /// **'Dark Line on My Belly?'**
  String get uncommonSymptom3Title;

  /// No description provided for @uncommonSymptom3Desc.
  ///
  /// In en, this message translates to:
  /// **'A dark, vertical line, called the \'linea nigra,\' may appear on your abdomen, running from your navel to your pubic bone.'**
  String get uncommonSymptom3Desc;

  /// No description provided for @uncommonSymptom3Normal.
  ///
  /// In en, this message translates to:
  /// **'Perfectly normal. This is caused by pregnancy hormones that increase melanin production in your skin. It\'s more common in women with darker complexions and will fade on its own a few months after delivery.'**
  String get uncommonSymptom3Normal;

  /// No description provided for @uncommonSymptom4Title.
  ///
  /// In en, this message translates to:
  /// **'My Gums Are Bleeding?'**
  String get uncommonSymptom4Title;

  /// No description provided for @uncommonSymptom4Desc.
  ///
  /// In en, this message translates to:
  /// **'You might notice that your gums are swollen, sensitive, or bleed easily when you brush or floss.'**
  String get uncommonSymptom4Desc;

  /// No description provided for @uncommonSymptom4Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, this is very common and is called \'pregnancy gingivitis.\' Hormonal changes make your gums more susceptible to plaque and inflammation. Maintain excellent oral hygiene and see your dentist for a checkup. It usually resolves after birth.'**
  String get uncommonSymptom4Normal;

  /// No description provided for @uncommonSymptom5Title.
  ///
  /// In en, this message translates to:
  /// **'My Feet Grew a Size?'**
  String get uncommonSymptom5Title;

  /// No description provided for @uncommonSymptom5Desc.
  ///
  /// In en, this message translates to:
  /// **'It might feel like your shoes are suddenly too tight, and your feet look flatter and longer.'**
  String get uncommonSymptom5Desc;

  /// No description provided for @uncommonSymptom5Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, this can happen! The pregnancy hormone relaxin loosens the ligaments in your feet, causing your arches to fall and your feet to spread. There can also be swelling. For some women, this change is permanent. It\'s a good reason to wear comfortable, supportive shoes.'**
  String get uncommonSymptom5Normal;

  /// No description provided for @uncommonSymptom6Title.
  ///
  /// In en, this message translates to:
  /// **'My Sense of Smell is Superhuman?'**
  String get uncommonSymptom6Title;

  /// No description provided for @uncommonSymptom6Desc.
  ///
  /// In en, this message translates to:
  /// **'Many women find their sense of smell becomes incredibly sensitive, making certain odors, even pleasant ones, suddenly overwhelming.'**
  String get uncommonSymptom6Desc;

  /// No description provided for @uncommonSymptom6Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, this is very common. Known as \'hyperosmia,\' it\'s caused by pregnancy hormones. It\'s often one of the earliest signs of pregnancy and usually subsides after the first trimester. Stick to unscented products if it bothers you.'**
  String get uncommonSymptom6Normal;

  /// No description provided for @uncommonSymptom7Title.
  ///
  /// In en, this message translates to:
  /// **'What is \'Lightning Crotch\'?'**
  String get uncommonSymptom7Title;

  /// No description provided for @uncommonSymptom7Desc.
  ///
  /// In en, this message translates to:
  /// **'Sudden, sharp, shooting pains deep in the pelvis, rectum, or vagina that last only a few seconds.'**
  String get uncommonSymptom7Desc;

  /// No description provided for @uncommonSymptom7Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, and it\'s aptly named! This is usually caused by the baby\'s pressure on nerves in your lower pelvis. While startling, it\'s generally harmless. Changing positions can often provide immediate relief.'**
  String get uncommonSymptom7Normal;

  /// No description provided for @uncommonSymptom8Title.
  ///
  /// In en, this message translates to:
  /// **'Am I Forgetting Everything?'**
  String get uncommonSymptom8Title;

  /// No description provided for @uncommonSymptom8Desc.
  ///
  /// In en, this message translates to:
  /// **'You might find yourself walking into a room and forgetting why, or struggling to find the right word. This is often called \'pregnancy brain.\''**
  String get uncommonSymptom8Desc;

  /// No description provided for @uncommonSymptom8Normal.
  ///
  /// In en, this message translates to:
  /// **'Completely normal! While not a formal medical condition, hormonal changes, lack of sleep, and the stress of pregnancy can contribute to this temporary fogginess. Make lists and be kind to yourself—your memory will return.'**
  String get uncommonSymptom8Normal;

  /// No description provided for @uncommonSymptom9Title.
  ///
  /// In en, this message translates to:
  /// **'My Belly Button Popped Out?'**
  String get uncommonSymptom9Title;

  /// No description provided for @uncommonSymptom9Desc.
  ///
  /// In en, this message translates to:
  /// **'As your uterus expands, it can push your navel forward, causing an \'innie\' to become an \'outie.\''**
  String get uncommonSymptom9Desc;

  /// No description provided for @uncommonSymptom9Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, this is a classic sign of a growing belly, usually happening in the second or third trimester. It\'s harmless and your belly button will almost always return to its former state after you give birth.'**
  String get uncommonSymptom9Normal;

  /// No description provided for @uncommonSymptom10Title.
  ///
  /// In en, this message translates to:
  /// **'My Vision Seems Blurry?'**
  String get uncommonSymptom10Title;

  /// No description provided for @uncommonSymptom10Desc.
  ///
  /// In en, this message translates to:
  /// **'You may notice your vision isn\'t as sharp, or your contact lenses feel uncomfortable.'**
  String get uncommonSymptom10Desc;

  /// No description provided for @uncommonSymptom10Normal.
  ///
  /// In en, this message translates to:
  /// **'Mild blurriness is normal. Fluid retention can slightly change the thickness and shape of your cornea. However, if you experience significant changes, double vision, or flashing lights, contact your doctor immediately as it can be a sign of preeclampsia.'**
  String get uncommonSymptom10Normal;

  /// No description provided for @uncommonSymptom11Title.
  ///
  /// In en, this message translates to:
  /// **'Are These New Skin Tags?'**
  String get uncommonSymptom11Title;

  /// No description provided for @uncommonSymptom11Desc.
  ///
  /// In en, this message translates to:
  /// **'Small, soft, skin-colored growths, often appearing in areas where skin rubs together, like under your arms, neck, or bra line.'**
  String get uncommonSymptom11Desc;

  /// No description provided for @uncommonSymptom11Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, it\'s very common. These are caused by hormones and cell growth. They are harmless and often disappear after pregnancy, though some may remain.'**
  String get uncommonSymptom11Normal;

  /// No description provided for @uncommonSymptom12Title.
  ///
  /// In en, this message translates to:
  /// **'Why Are My Breasts Leaking?'**
  String get uncommonSymptom12Title;

  /// No description provided for @uncommonSymptom12Desc.
  ///
  /// In en, this message translates to:
  /// **'You might notice a yellowish, sticky fluid leaking from your nipples. This is colostrum, your baby\'s first milk.'**
  String get uncommonSymptom12Desc;

  /// No description provided for @uncommonSymptom12Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, this is your body\'s way of preparing to breastfeed. It can start as early as the second trimester. If it\'s bothersome, you can use nursing pads inside your bra. Don\'t worry, you won\'t \'run out\' before the baby arrives!'**
  String get uncommonSymptom12Normal;

  /// No description provided for @uncommonSymptom13Title.
  ///
  /// In en, this message translates to:
  /// **'Increased Vaginal Discharge?'**
  String get uncommonSymptom13Title;

  /// No description provided for @uncommonSymptom13Desc.
  ///
  /// In en, this message translates to:
  /// **'An increase in a thin, milky-white, and mild-smelling discharge is common throughout pregnancy.'**
  String get uncommonSymptom13Desc;

  /// No description provided for @uncommonSymptom13Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, this is called \'leukorrhea\' and it\'s perfectly normal. It helps prevent infections from traveling up into the uterus. If the discharge is colored, has a strong odor, or is accompanied by itching or burning, call your doctor.'**
  String get uncommonSymptom13Normal;

  /// No description provided for @uncommonSymptom14Title.
  ///
  /// In en, this message translates to:
  /// **'My Hair is So Thick!'**
  String get uncommonSymptom14Title;

  /// No description provided for @uncommonSymptom14Desc.
  ///
  /// In en, this message translates to:
  /// **'You may notice that your hair feels fuller and you\'re shedding less than usual.'**
  String get uncommonSymptom14Desc;

  /// No description provided for @uncommonSymptom14Normal.
  ///
  /// In en, this message translates to:
  /// **'Yes, enjoy it while it lasts! Pregnancy hormones prolong the growth phase of your hair follicles, meaning you don\'t shed as much. Be aware that this will reverse after birth, leading to a period of noticeable (but normal) postpartum hair loss.'**
  String get uncommonSymptom14Normal;

  /// No description provided for @uncommonSymptom15Title.
  ///
  /// In en, this message translates to:
  /// **'My Legs Won\'t Stop Twitching at Night?'**
  String get uncommonSymptom15Title;

  /// No description provided for @uncommonSymptom15Desc.
  ///
  /// In en, this message translates to:
  /// **'An uncontrollable urge to move your legs, often accompanied by a creepy-crawly or jittery sensation, especially when you\'re trying to rest.'**
  String get uncommonSymptom15Desc;

  /// No description provided for @uncommonSymptom15Normal.
  ///
  /// In en, this message translates to:
  /// **'This sounds like Restless Leg Syndrome (RLS), which is very common in the third trimester. It\'s often linked to iron or folate deficiency. Stretching before bed, massage, and ensuring you have enough iron in your diet can help.'**
  String get uncommonSymptom15Normal;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageRussian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get languageRussian;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get languageSpanish;

  /// No description provided for @babySizeTinyCells.
  ///
  /// In en, this message translates to:
  /// **'a tiny ball of cells'**
  String get babySizeTinyCells;

  /// No description provided for @babySizePoppySeed.
  ///
  /// In en, this message translates to:
  /// **'a poppy seed'**
  String get babySizePoppySeed;

  /// No description provided for @babySizeAppleSeed.
  ///
  /// In en, this message translates to:
  /// **'an apple seed'**
  String get babySizeAppleSeed;

  /// No description provided for @babySizeSweetPea.
  ///
  /// In en, this message translates to:
  /// **'a sweet pea'**
  String get babySizeSweetPea;

  /// No description provided for @babySizeBlueberry.
  ///
  /// In en, this message translates to:
  /// **'a blueberry'**
  String get babySizeBlueberry;

  /// No description provided for @babySizeRaspberry.
  ///
  /// In en, this message translates to:
  /// **'a raspberry'**
  String get babySizeRaspberry;

  /// No description provided for @babySizeCherry.
  ///
  /// In en, this message translates to:
  /// **'a cherry'**
  String get babySizeCherry;

  /// No description provided for @babySizeStrawberry.
  ///
  /// In en, this message translates to:
  /// **'a strawberry'**
  String get babySizeStrawberry;

  /// No description provided for @babySizeLime.
  ///
  /// In en, this message translates to:
  /// **'a lime'**
  String get babySizeLime;

  /// No description provided for @babySizePlum.
  ///
  /// In en, this message translates to:
  /// **'a plum'**
  String get babySizePlum;

  /// No description provided for @babySizePeach.
  ///
  /// In en, this message translates to:
  /// **'a peach'**
  String get babySizePeach;

  /// No description provided for @babySizeLemon.
  ///
  /// In en, this message translates to:
  /// **'a lemon'**
  String get babySizeLemon;

  /// No description provided for @babySizeApple.
  ///
  /// In en, this message translates to:
  /// **'an apple'**
  String get babySizeApple;

  /// No description provided for @babySizeAvocado.
  ///
  /// In en, this message translates to:
  /// **'an avocado'**
  String get babySizeAvocado;

  /// No description provided for @babySizePear.
  ///
  /// In en, this message translates to:
  /// **'a pear'**
  String get babySizePear;

  /// No description provided for @babySizeBellPepper.
  ///
  /// In en, this message translates to:
  /// **'a bell pepper'**
  String get babySizeBellPepper;

  /// No description provided for @babySizeMango.
  ///
  /// In en, this message translates to:
  /// **'a mango'**
  String get babySizeMango;

  /// No description provided for @babySizeBanana.
  ///
  /// In en, this message translates to:
  /// **'a banana'**
  String get babySizeBanana;

  /// No description provided for @babySizeCarrot.
  ///
  /// In en, this message translates to:
  /// **'a carrot'**
  String get babySizeCarrot;

  /// No description provided for @babySizeSpaghettiSquash.
  ///
  /// In en, this message translates to:
  /// **'a spaghetti squash'**
  String get babySizeSpaghettiSquash;

  /// No description provided for @babySizeGrapefruit.
  ///
  /// In en, this message translates to:
  /// **'a grapefruit'**
  String get babySizeGrapefruit;

  /// No description provided for @babySizeCorn.
  ///
  /// In en, this message translates to:
  /// **'an ear of corn'**
  String get babySizeCorn;

  /// No description provided for @babySizeCauliflower.
  ///
  /// In en, this message translates to:
  /// **'a cauliflower'**
  String get babySizeCauliflower;

  /// No description provided for @babySizeLettuce.
  ///
  /// In en, this message translates to:
  /// **'a head of lettuce'**
  String get babySizeLettuce;

  /// No description provided for @babySizeRutabaga.
  ///
  /// In en, this message translates to:
  /// **'a rutabaga'**
  String get babySizeRutabaga;

  /// No description provided for @babySizeEggplant.
  ///
  /// In en, this message translates to:
  /// **'an eggplant'**
  String get babySizeEggplant;

  /// No description provided for @babySizeButternutSquash.
  ///
  /// In en, this message translates to:
  /// **'a butternut squash'**
  String get babySizeButternutSquash;

  /// No description provided for @babySizeCabbage.
  ///
  /// In en, this message translates to:
  /// **'a cabbage'**
  String get babySizeCabbage;

  /// No description provided for @babySizeCoconut.
  ///
  /// In en, this message translates to:
  /// **'a coconut'**
  String get babySizeCoconut;

  /// No description provided for @babySizeJicama.
  ///
  /// In en, this message translates to:
  /// **'a jicama'**
  String get babySizeJicama;

  /// No description provided for @babySizePineapple.
  ///
  /// In en, this message translates to:
  /// **'a pineapple'**
  String get babySizePineapple;

  /// No description provided for @babySizeCantaloupe.
  ///
  /// In en, this message translates to:
  /// **'a cantaloupe'**
  String get babySizeCantaloupe;

  /// No description provided for @babySizeHoneydew.
  ///
  /// In en, this message translates to:
  /// **'a honeydew melon'**
  String get babySizeHoneydew;

  /// No description provided for @babySizeRomaine.
  ///
  /// In en, this message translates to:
  /// **'a head of romaine'**
  String get babySizeRomaine;

  /// No description provided for @babySizeSwissChard.
  ///
  /// In en, this message translates to:
  /// **'a bunch of swiss chard'**
  String get babySizeSwissChard;

  /// No description provided for @babySizeLeek.
  ///
  /// In en, this message translates to:
  /// **'a leek'**
  String get babySizeLeek;

  /// No description provided for @babySizePumpkin.
  ///
  /// In en, this message translates to:
  /// **'a small pumpkin'**
  String get babySizePumpkin;

  /// No description provided for @babySizeWatermelon.
  ///
  /// In en, this message translates to:
  /// **'a watermelon'**
  String get babySizeWatermelon;

  /// No description provided for @babySizeReady.
  ///
  /// In en, this message translates to:
  /// **'ready to meet you!'**
  String get babySizeReady;

  /// No description provided for @toolsHubTitle.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy Tools'**
  String get toolsHubTitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
