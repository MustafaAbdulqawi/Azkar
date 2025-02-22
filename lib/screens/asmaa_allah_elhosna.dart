import 'package:flutter/material.dart';

import '../constants.dart';

class AsmaaAllahElhosna extends StatelessWidget {
  const AsmaaAllahElhosna({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        title: const Text(
          "أسماء الله الحسنى",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5ACFB8),
        scrolledUnderElevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.builder(
          itemCount: asmaaAllahElhosna.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.teal, Colors.greenAccent],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    asmaaAllahElhosna[index]["content"] ?? "",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
