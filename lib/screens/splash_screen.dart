import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/صورة واتساب بتاريخ 1446-08-20 في 20.06.40_41a174ab.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Text(
              "تطبيق ديني على روح مصطفى خالد",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
