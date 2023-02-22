import 'package:clinic/view/view_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/products_ctr.dart';

class TelevisionView extends StatefulWidget {
  const TelevisionView({super.key});

  @override
  State<TelevisionView> createState() => _TelevisionViewState();
}

class _TelevisionViewState extends State<TelevisionView> {
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
                      Get.to(() => const ViewProductView('tv', 'lg'));
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
                            'LG',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ))),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewProductView('tv', 'sony'));
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
                            'Sony',
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
                      Get.to(() => const ViewProductView('tv', 'tcl'));
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
                            'TCL',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ))),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewProductView('tv', 'samsung'));
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
            )
          ],
        ),
      ),
    );
  }
}
