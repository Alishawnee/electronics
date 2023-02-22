import '../model/product.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsCtr extends GetxController {
  List<ProductModel> products = [];
  bool isLoadingProduct = false;

  Future<void> getProducts(String type, String brand) async {
    List<ProductModel> loadedProducts = [];
    try {
      isLoadingProduct = true;
      var data = await FirebaseFirestore.instance
          .collection('Products')
          .where('type', isEqualTo: type)
          .where('brand', isEqualTo: brand)
          .get();

      for (var e in data.docs) {
        loadedProducts.add(ProductModel.fromJson(e.data()));
      }
      products = loadedProducts;
      isLoadingProduct = false;
      update();
    } catch (e) {
      print(e.toString());
      isLoadingProduct = false;
      update();
    }
  }
}
