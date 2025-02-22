import 'package:azkar2/constants.dart';
import 'package:flutter/material.dart';

class FadlElqoraan extends StatelessWidget {
  const FadlElqoraan({
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
          "فضل القران",
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
          itemCount: fadlElqoraan.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  fadlElqoraan[index]["title"] ?? "",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFFD4A017),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  fadlElqoraan[index]["content"],
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
                //         fadlElqoraan[index]["number"] ?? "1",
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
                  fadlElqoraan[index]["end"] ?? "",
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
