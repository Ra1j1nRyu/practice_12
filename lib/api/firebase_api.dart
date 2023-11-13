import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

final Logger _logger = Logger();

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  _logger.d('Title: ${message.notification?.title}');
  _logger.d('Body: ${message.notification?.body}');
  _logger.d('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    _logger.d('Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}