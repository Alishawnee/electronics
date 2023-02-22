import 'package:clinic/controller/cart_ctr.dart';
import 'package:clinic/controller/favorite_ctr.dart';
import 'package:clinic/view/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final favCtr = Get.put(FavoriteCtr());
  @override
  void initState() {
    favCtr.getFavs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 25, 26, 90),
      body: GetBuilder<FavoriteCtr>(
        builder: (_) => favCtr.isLoadingProduct
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
                    itemCount: favCtr.favProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, i) => GestureDetector(
                          onTap: () {
                            Get.to(
                                () => ProductDetailView(favCtr.favProducts[i]));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                                              .addItem(favCtr.favProducts[i]);
                                        },
                                        icon: const Icon(
                                            Icons.add_shopping_cart,
                                            size: 30,
                                            color: Colors.orangeAccent)),
                                    title: Text(favCtr.favProducts[i].title!),
                                  ),
                                ),
                                child: Image.network(
                                    favCtr.favProducts[i].imageUrl!),
                              )),
                        )),
              ),
      ),
    );
  }
}
