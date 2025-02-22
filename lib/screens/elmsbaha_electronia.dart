import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/counter_controller.dart';

class ElmsbahaElectronia extends StatelessWidget {
  ElmsbahaElectronia({super.key});

  final CounterController controller = Get.put(CounterController());
  final RxString zikr = 'اضغط لإضافة ذكر'.obs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue[900],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[50],
        title: Text(
          "المسبحه الاكترونيه",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        color: Colors.blue[50],
        child: Obx((() {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: ListView(
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "جميع تسبيحات اليوم :${controller.allCounter} ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.010),
                Center(
                  child: Text(
                    controller.counter.value.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.green[800],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.020),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showEditZikrDialog(context);
                    },
                    child: Text(
                      zikr.value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.42),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.reset();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blue[700],
                        radius: 30,
                        child: const Icon(
                          Icons.refresh,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth *0.04),
                    GestureDetector(
                      onTap: () {
                        controller.incrementCounter();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.green[700],
                        radius: 100,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.020),
              ],
            ),
          );
        })),
      ),
    );
  }

  void _showEditZikrDialog(BuildContext context) {
    final TextEditingController textController = TextEditingController(
      text: "",
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(""),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("إلغاء"),
            ),
            TextButton(
              onPressed: () {
                zikr.value = textController.text;
                Navigator.of(context).pop();
              },
              child: const Text("حفظ"),
            ),
          ],
        );
      },
    );
  }
}
