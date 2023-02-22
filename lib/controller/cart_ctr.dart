import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/cart.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class CartCtr extends GetxController {
  List<Cart> cart = [];

  getCart() async {
    cart = [];
    List<Cart> loadedCart = [];
    try {
      var data = await FirebaseFirestore.instance
          .collection('Cart')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('MyCart')
          .get();

      for (var e in data.docs) {
        loadedCart.add(Cart.fromJson(e.data()));
      }

      items = loadedCart;
    } catch (e) {}
  }

  addCartToSever(Cart cart) async {
    try {
      await FirebaseFirestore.instance
          .collection('Cart')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('MyCart')
          .doc(cart.id)
          .set(cart.toJson());
    } catch (e) {}
  }

  updateCartInServer(String idCart, num quantity) async {
    try {
      await FirebaseFirestore.instance
          .collection('Cart')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('MyCart')
          .doc(idCart)
          .update({'quantity': quantity});
    } catch (e) {}
  }

  deleteCartFromServer(String idCart) async {
    try {
      await FirebaseFirestore.instance
          .collection('Cart')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('MyCart')
          .doc(idCart)
          .delete();
    } catch (e) {}
  }

  List<Cart> items = [];

  double get totalAmount {
    var total = 0.0;
    for (var cardItem in items) {
      total += cardItem.price * cardItem.quantity;
    }
    return total;
  }

  void addItem(
    ProductModel product,
  ) {
    if (items.any((e) => e.id == product.id!)) {
      Fluttertoast.showToast(
        msg: "The product is already in the cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    } else {
      Cart c = Cart(
          id: product.id!,
          imageUrl: product.imageUrl!,
          title: product.title!,
          price: product.price!,
          quantity: 1);
      items.add(c);

      Fluttertoast.showToast(
        msg: "Done add product to cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      addCartToSever(c);
    }
    update();
  }

  void removeItem(String productId) {
    items.removeWhere((e) => e.id == productId);
    update();
    deleteCartFromServer(productId);
  }

  void addSameItem(String productId) {
    if (items.any((e) => e.id == productId)) {
      int i = items.indexWhere((e) => e.id == productId);
      items[i].quantity += 1;
      updateCartInServer(productId, items[i].quantity);
    }

    update();
  }

  void deleteSameItem(String productId) {
    if (items.any((e) => e.id == productId)) {
      int i = items.indexWhere((e) => e.id == productId);

      items[i].quantity > 0 ? items[i].quantity -= 1 : items[i].quantity;
      updateCartInServer(productId, items[i].quantity);
    }
    update();
  }

  Future<void> clear() async {
    items = [];
    try {
      await FirebaseFirestore.instance
          .collection('Cart')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("MyCart")
          .get()
          .then((d) async {
        for (var i in d.docs) {
          await FirebaseFirestore.instance
              .collection('Cart')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("MyCart")
              .doc(i.id)
              .delete();
        }
      });
    } catch (e) {}
    update();
  }
}
