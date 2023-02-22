import 'package:clinic/controller/cart_ctr.dart';
import 'package:clinic/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:badges/badges.dart';
import 'package:get/get.dart';

class MyBadge extends StatelessWidget {
  MyBadge({Key? key}) : super(key: key);
  final _cartCtr = Get.find<CartCtr>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCtr>(
      builder: (_) => Badge(
        position: BadgePosition.topEnd(top: 0, end: 2),
        badgeContent: Text(
          _cartCtr.items.length.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        child: IconButton(
          onPressed: () {
            Get.to(
              () => CartView(),
            );
          },
          icon: const Icon(FontAwesomeIcons.cartShopping,
              size: 30, color: Color(0xff595CFF)),
        ),
      ),
    );
  }
}
