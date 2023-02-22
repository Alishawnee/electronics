import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'view_product_view.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
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
                      Get.to(() => const ViewProductView('mobile', 'apple'));
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
                      Get.to(() => const ViewProductView('mobile', 'samsung'));
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
                            'SAMSUNG',
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
                      Get.to(() => const ViewProductView('mobile', 'xiaomi'));
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
                            'XIAOMI',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ))),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewProductView('mobile', 'huawei'));
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
                            'HUAWEI',
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
