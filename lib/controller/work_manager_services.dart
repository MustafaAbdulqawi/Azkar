import 'package:workmanager/workmanager.dart';
import 'notification_services.dart';

class WorkManagerService {
  static Future<void> init() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: false,
    );

    registerMyTask();
  }

  static void registerMyTask() async {
    await Workmanager().registerPeriodicTask(
      'id1',
      'show_simple_notification',
      frequency: const Duration(minutes: 1),
      initialDelay: const Duration(minutes: 2),
      existingWorkPolicy: ExistingWorkPolicy.keep,
      inputData: {},
    );
  }


  static void cancelTask() {
    Workmanager().cancelAll();
  }
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {

      if (inputData == null) {
        print("🔹 Task executed without inputData");
      } else {
        print("🔹 Task executed with inputData: $inputData");
      }

      await NotificationService.showNotification();
      return Future.value(true);
    } catch (e) {
      print("❌ Error in WorkManager task: $e");
      return Future.value(false);
    }
  });
}
