import 'package:clinic/controller/cart_ctr.dart';
import 'package:clinic/controller/products_ctr.dart';
import 'package:clinic/model/product.dart';
import 'package:clinic/view/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ViewProductView extends StatefulWidget {
  const ViewProductView(
    this.type,
    this.brand, {
    super.key,
  });
  final String type;
  final String brand;
  @override
  State<ViewProductView> createState() => _ViewProductViewState();
}

class _ViewProductViewState extends State<ViewProductView> {
  final productCtr = Get.put(ProductsCtr());

  @override
  void initState() {
    productCtr.getProducts(widget.type, widget.brand);
    super.initState();
  }

  @override
  void dispose() {
    productCtr.products = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 25, 26, 90),
      body: GetBuilder<ProductsCtr>(
        builder: (_) => productCtr.isLoadingProduct
            ? Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Color(0xff595CFF),
                  strokeWidth: 10,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                    itemCount: productCtr.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, i) => GestureDetector(
                          onTap: () async {
                            // await Future.delayed(Duration(seconds: 4));
                            Get.to(() =>
                                ProductDetailView(productCtr.products[i]));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 2, color: const Color(0xff595CFF)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: GridTile(
                                footer: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                  child: GridTileBar(
                                    backgroundColor: Colors.black87,
                                    trailing: IconButton(
                                        onPressed: () {
                                          Get.put(CartCtr())
                                              .addItem(productCtr.products[i]);
                                        },
                                        icon: const Icon(
                                            Icons.add_shopping_cart,
                                            size: 30,
                                            color: Colors.orangeAccent)),
                                    title: Text(productCtr.products[i].title!),
                                  ),
                                ),
                                child: Image.network(
                                    productCtr.products[i].imageUrl!),
                              )),
                        )),
              ),
      ),
    );
  }
}
