import 'package:clinic/controller/favorite_ctr.dart';
import 'package:clinic/model/product.dart';
import 'package:flutter/material.dart';
import '../../controller/products_ctr.dart';
import '../controller/home_controller.dart';
import 'badge.dart';
import '../../controller/cart_ctr.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatefulWidget {
  ProductDetailView(this.product, {Key? key}) : super(key: key);
  final ProductModel product;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  late final favoriteCtr;
  @override
  void initState() {
    favoriteCtr = Get.put(FavoriteCtr());
    favoriteCtr.getIsFav(widget.product.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FavoriteCtr>(
        builder: (_) => favoriteCtr.isLoadFav
            ? Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  color: Color(0xff595CFF),
                  strokeWidth: 10,
                ),
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.product.imageUrl!),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xff595CFF), shape: BoxShape.circle),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              favoriteCtr.changeFavorite(
                                  widget.product.id!, widget.product);
                            },
                            child: Icon(
                              Icons.favorite,
                              size: 30,
                              color: favoriteCtr.isFavorite == null ||
                                      !favoriteCtr.isFavorite
                                  ? Colors.grey
                                  : Colors.red,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.title!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 25, 26, 90),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "\$ ${widget.product.price!.toStringAsFixed(1)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 22),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Descreption",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreText(
                        widget.product.description!,
                        style: const TextStyle(
                          color: Color(0xff14154F),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        trimLines: 7,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    MyBadge(),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.put(CartCtr()).addItem(widget.product);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xff595CFF),
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(50)),
                          ),
                          child: const Text(
                            "add to cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
      ),
    );
  }
}
