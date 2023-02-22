import 'package:clinic/view/view_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LapTopView extends StatefulWidget {
  const LapTopView({super.key});

  @override
  State<LapTopView> createState() => _LapTopViewState();
}

class _LapTopViewState extends State<LapTopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewProductView('laptop', 'apple'));
                    },
                    child: Container(
                        height: Get.height * 0.23,
                        width: Get.width * 0.42,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: const Color(0xff595CFF),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'APPLE',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ))),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewProductView('laptop', 'lenovo'));
                    },
                    child: Container(
                        height: Get.height * 0.23,
                        width: Get.width * 0.42,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: const Color(0xff595CFF),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Lenovo',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )))
              ],
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewProductView('laptop', 'hp'));
                    },
                    child: Container(
                        height: Get.height * 0.23,
                        width: Get.width * 0.42,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: const Color(0xff595CFF),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'HP',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ))),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewProductView('laptop', 'dell'));
                    },
                    child: Container(
                        height: Get.height * 0.23,
                        width: Get.width * 0.42,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: const Color(0xff595CFF),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Dell',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
