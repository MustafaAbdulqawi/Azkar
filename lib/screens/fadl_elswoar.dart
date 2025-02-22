import 'package:azkar2/constants.dart';
import 'package:flutter/material.dart';

class FadlElswoar extends StatelessWidget {
  const FadlElswoar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E7),
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
          "فضل السور",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5ACFB8),
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: fadlElsewar.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  fadlElsewar[index]["title"] ?? "",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFFD4A017),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  fadlElsewar[index]["content"],
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     CircleAvatar(
                //       backgroundColor: const Color(0xFFD4A017),
                //       child: Text(
                //         fadlElsewar[index]["number"] ?? "1",
                //         style: const TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 10),
                Text(
                  fadlElsewar[index]["end"] ?? "",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF3A7CA5),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Color(0xFFC0C0C0),
              thickness: 1.0,
            );
          },
        ),
      ),
    );
  }
}
