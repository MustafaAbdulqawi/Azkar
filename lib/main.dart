import 'package:azkar2/screens/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:azkar2/screens/ad3ya_elanbyaa.dart';
import 'package:azkar2/screens/ad3ya_lelmotawafey.dart';
import 'package:azkar2/screens/ad3ya_nabaywa.dart';
import 'package:azkar2/screens/ad3ya_qoraanya.dart';
import 'package:azkar2/screens/asmaa_allah_elhosna.dart';
import 'package:azkar2/screens/azkar_alkhelaa.dart';
import 'package:azkar2/screens/azkar_b3d_elsallaa.dart';
import 'package:azkar2/screens/azkar_elazan.dart';
import 'package:azkar2/screens/azkar_elestyqaz.dart';
import 'package:azkar2/screens/azkar_elheg_wel3omra.dart';
import 'package:azkar2/screens/azkar_elmanzel.dart';
import 'package:azkar2/screens/azkar_elmasaa.dart';
import 'package:azkar2/screens/azkar_elmasged.dart';
import 'package:azkar2/screens/azkar_elnom.dart';
import 'package:azkar2/screens/azkar_elsabah.dart';
import 'package:azkar2/screens/azkar_elsalaa.dart';
import 'package:azkar2/screens/azkar_elt3am.dart';
import 'package:azkar2/screens/azkar_elwdoo3.dart';
import 'package:azkar2/screens/azkar_motafrqa.dart';
import 'package:azkar2/screens/doaa_khetm_alqoraan.dart';
import 'package:azkar2/screens/elmsbaha_electronia.dart';
import 'package:azkar2/screens/elroqia_elshar3ya.dart';
import 'package:azkar2/screens/fadl_eldoaa.dart';
import 'package:azkar2/screens/fadl_elqoraan.dart';
import 'package:azkar2/screens/fadl_elswoar.dart';
import 'package:azkar2/screens/fadl_elzkr.dart';
import 'package:azkar2/screens/gwamed3_eldo3aa.dart';
import 'package:azkar2/screens/home.dart';
import 'package:azkar2/screens/quran_screen.dart';
import 'package:azkar2/screens/tasbeh.dart';
import 'controller/ios_notification_services.dart';
import 'controller/notification_services.dart';
import 'controller/work_manager_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await NotificationService.init();
  if (!kIsWeb) {
    await WorkManagerService.init();
     await IOSNotificationService.init();
  }
  requestNotificationPermission();
  // SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.manual,
  //   overlays: [],
  // );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

void requestNotificationPermission() async {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  final bool? granted = await androidImplementation?.requestPermission();
  if (granted ?? false) {
    print("✅ Notification Permission Granted!");
  } else {
    print("❌ Notification Permission Denied!");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/azkar_elsabah': (context) => const AzkarElsabah(),
        '/azkar_elmasaa': (context) => const AzkarElmasaa(),
        '/azkar_b3d_elsallaa': (context) => const AzkarBadElsallaa(),
        '/tasbeh': (context) => const Tasbeh(),
        '/azkar_elnom': (context) => const AzkarElnom(),
        "/azkar_elstyqaz": (context) => const AzkarElestyqaz(),
        "/azkar_elsallaa": (context) => const AzkarElsalaa(),
        "/gwamed3_eldo3aa": (context) => const Gwamed3Eldo3aa(),
        "/ad3ya_nbaweya": (context) => const Ad3yaNabaywa(),
        "/alad3ya_elqoraanya": (context) => const Ad3yaQoraanya(),
        "/ad3ya_elanbyaa": (context) => const Ad3yaElanbyaa(),
        "/azkar_motafareqa": (context) => const AzkarMotafrqa(),
        "/azkar-elazan": (context) => const AzkarElazan(),
        "/azkar_elmasged": (context) => const AzkarElmasged(),
        "/azkar_elwodo2": (context) => const AzkarElwdoo3(),
        "/azkar_elmanzel": (context) => const AzkarElmanzel(),
        "/azkar_elkhelaa": (context) => const AzkarAlkhelaa(),
        "/azkar_elt3am": (context) => const AzkarElt3am(),
        "/azkar_elhegwel3omra": (context) => const AzkarElhegWel3omra(),
        "/doaa_khetm_elqoraan": (context) => const DoaaKhetmAlqoraan(),
        "/fadl-eldo3aa": (context) => const FadlEldoaa(),
        "/fadl-elzekr": (context) => const FadlElzkr(),
        "/fadl_elsewar": (context) => const FadlElswoar(),
        "/asmaa_allah_elhosna": (context) => const AsmaaAllahElhosna(),
        "/fadl_elqoraan": (context) => const FadlElqoraan(),
        "/ad3ya_lelmotawafey": (context) => const Ad3yaLelmotawafey(),
        "/elroqia_elshar3ya": (context) => const ElroqiaElshar3ya(),
        "/elmsbaha_electronia": (context) => ElmsbahaElectronia(),
        "/quraan_screen": (context) => const QuranScreen(),
      },
    );
  }
}
