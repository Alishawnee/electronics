import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:get/get.dart';
import '../model/product.dart';

class SearchCtr extends GetxController {
  List<ProductModel> searchList = [];
  List<String> listHistory = [];

  void searchProduct(String query) async {
    List<ProductModel> loadedList = [];
    try {
      var data = await FirebaseFirestore.instance
          .collection("Products")
          .where('title',
              isGreaterThanOrEqualTo: query,
              isLessThan: query.substring(0, query.length - 1) +
                  String.fromCharCode(query.codeUnitAt(query.length - 1) + 1))
          .limit(50)
          .get();
      for (var e in data.docs) {
        loadedList.add(ProductModel.fromJson(e.data()));
      }
    } catch (_) {}
    loadedList.sort((a, b) => a.price!.compareTo(b.price!));
    searchList = loadedList;
    update();
  }

  void addToHistory(query) {
    listHistory.add(query);
  }
}
