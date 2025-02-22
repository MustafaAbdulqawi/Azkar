import 'dart:math';
import 'package:azkar2/controller/static_variables.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings =
    InitializationSettings(android: androidSettings);

    await _notificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        handleNotificationClick(response.payload);
      },
    );
  }

  static void handleNotificationClick(String? payload) {
    if (payload != null) {

      // Get.toNamed(payload);
    }
  }

  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'This is the channel description',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

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
