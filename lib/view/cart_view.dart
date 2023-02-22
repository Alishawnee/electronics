import 'package:clinic/view/order_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../controller/cart_ctr.dart';

import 'package:get/get.dart';

class CartView extends StatelessWidget {
  final cartCtr = Get.put(CartCtr());

  CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartCtr>(
              builder: (_) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartCtr.items.length,
                itemBuilder: (context, i) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.all(15),
                  height: MediaQuery.of(context).size.width * 0.32,
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 129, 130, 215),
                    border:
                        Border.all(width: 3, color: const Color(0xff595CFF)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          cartCtr.removeItem(cartCtr.items[i].id);
                        },
                        icon: const Icon(
                          FontAwesomeIcons.trash,
                          color: Colors.redAccent,
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width * 0.25,
                            child: Image.network(
                              cartCtr.items[i].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartCtr.items[i].title,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                letterSpacing: 2,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "\$ ${(cartCtr.items[i].price * cartCtr.items[i].quantity).toStringAsFixed(1)}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 150, 97, 225),
                              ),
                            ),
                            child: Container(
                              color: const Color(0xff595CFF),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        cartCtr.deleteSameItem(
                                            cartCtr.items[i].id);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(
                                          FontAwesomeIcons.minus,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${cartCtr.items[i].quantity}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        cartCtr
                                            .addSameItem(cartCtr.items[i].id);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Icon(
                                          FontAwesomeIcons.plus,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      'Total amount:  ',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    GetBuilder<CartCtr>(builder: (_) {
                      return Text(
                        "\$ ${cartCtr.totalAmount.toStringAsFixed(1)}",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      );
                    }),
                  ],
                ),
                const Spacer(),
                GetBuilder<CartCtr>(
                  builder: (_) => GestureDetector(
                    onTap: (cartCtr.totalAmount <= 0)
                        ? null
                        : () async {
                            Get.to(() => const OrderView());
                            cartCtr.clear();
                          },
                    child: const Chip(
                      backgroundColor: Colors.orangeAccent,
                      padding: EdgeInsets.all(3),
                      elevation: 4,
                      label: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Buy',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 25, 26, 90),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
