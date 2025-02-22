import 'dart:math';
import 'dart:io';
import 'package:azkar2/controller/static_variables.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class IOSNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    if (Platform.isIOS) {
      const DarwinInitializationSettings iosSettings = DarwinInitializationSettings();

      const InitializationSettings settings =
      InitializationSettings(iOS: iosSettings);

      await _notificationsPlugin.initialize(
        settings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          handleNotificationClick(response.payload);
        },
      );
    }
  }

  static void handleNotificationClick(String? payload) {
    if (payload != null) {
      // Get.toNamed(payload);
    }
  }

  static Future<void> showNotification() async {
    const DarwinNotificationDetails iosDetails =
    DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails notificationDetails =
    NotificationDetails(iOS: iosDetails);

    await _notificationsPlugin.show(
      0,
      'تذكير',
      StaticVars()
          .smallDo3a2[Random().nextInt(StaticVars().smallDo3a2.length - 1)],
      notificationDetails,
      payload: "/home",
    );
  }
}
