// --- notification_service.dart ---

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:bloom_mama/daily_content.dart';
import 'l10n/app_localizations.dart'; // Import localizations

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _notificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones();
  }

  // This function now requires the AppLocalizations object
  Future<void> scheduleDailyAffirmations(AppLocalizations loc) async {
    await cancelAllNotifications();

    // Get the localized list of affirmations
    final affirmations = getDailyAffirmations(loc);
    final random = Random();
    final morningAffirmation = affirmations[random.nextInt(affirmations.length)];
    final eveningAffirmation = affirmations[random.nextInt(affirmations.length)];

    await _scheduleNotification(
      id: 1,
      title: loc.notificationMorningTitle, // Use localized title
      body: morningAffirmation,
      time: const TimeOfDay(hour: 9, minute: 0),
      loc: loc,
    );

    await _scheduleNotification(
      id: 2,
      title: loc.notificationEveningTitle, // Use localized title
      body: eveningAffirmation,
      time: const TimeOfDay(hour: 20, minute: 0),
      loc: loc,
    );
  }

  // This helper function also requires the AppLocalizations object
  Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
    required AppLocalizations loc,
  }) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_affirmations_channel',
          loc.notificationChannelName, // Use localized channel name
          channelDescription: loc.notificationChannelDescription, // Use localized description
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }
}