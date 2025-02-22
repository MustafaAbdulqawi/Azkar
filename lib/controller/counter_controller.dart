import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CounterController extends GetxController {
  final storage = GetStorage();
  var counter = 0.obs;
  var allCounter = 0.obs;

  @override
  void onInit() {
    super.onInit();

    counter.value = storage.read("counter") ?? 0;
    allCounter.value = storage.read("allCounter") ?? 0;
    _checkForNewDay();
  }

  void incrementCounter() {
    counter++;
    allCounter++;
    storage.write("counter", counter.value);
    storage.write("allCounter", allCounter.value);
    storage.write("lastUpdateTime", DateTime.now().toIso8601String());
  }

  void reset() {
    counter.value = 0;
    storage.write("counter", counter.value);
  }

  void _checkForNewDay() {
    String? lastUpdateTime = storage.read("lastUpdateTime");

    if (lastUpdateTime != null) {
      DateTime lastUpdate = DateTime.parse(lastUpdateTime);
      DateTime now = DateTime.now();


      if (now.day != lastUpdate.day || now.month != lastUpdate.month || now.year != lastUpdate.year) {
        allCounter.value = 0;
        counter.value = 0;
        storage.write("allCounter", allCounter.value);
        storage.write("counter", counter.value);
      }
    }
  }
}
