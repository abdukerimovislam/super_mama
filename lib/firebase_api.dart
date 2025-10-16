// --- firebase_api.dart ---
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    // Request permission from the user
    await _firebaseMessaging.requestPermission();

    // Get the FCM token for this device
    final fcmToken = await _firebaseMessaging.getToken();

    // You would normally save this token to your user's document in Firestore
    print("FCM Token: $fcmToken");
  }
}