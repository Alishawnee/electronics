import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/favorite.dart';
import '../model/product.dart';

class FavoriteCtr extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore store = FirebaseFirestore.instance;

  var isFavorite;
  bool isLoadFav = false;
  List<ProductModel> favProducts = [];

  getIsFav(String idProduct) async {
    try {
      isLoadFav = true;
      final data = await store
          .collection('Products')
          .doc(idProduct)
          .collection('Favorites')
          .doc(auth.currentUser!.uid)
          .get();
      isFavorite = data.data()!['fav'];
      isLoadFav = false;
      update();
    } catch (e) {
      Favorite favModel = Favorite(
        iduser: auth.currentUser!.uid,
        idProduct: idProduct,
        isFavorite: false,
      );
      await store
          .collection('Products')
          .doc(idProduct)
          .collection('Favorites')
          .doc(auth.currentUser!.uid)
          .set(favModel.toMap());
      isFavorite = false;
      isLoadFav = false;
      update();
    }
  }

  changeFavorite(String idProduct, ProductModel product) async {
    try {
      await store
          .collection('Products')
          .doc(idProduct)
          .collection('Favorites')
          .doc(auth.currentUser!.uid)
          .update({
        'fav': !isFavorite,
      });
      isFavorite = !isFavorite;
      update();
      setDeleteMyFavs(isFavorite, product);
    } catch (_) {
      isFavorite = !isFavorite;
      update();
    }
  }

  setDeleteMyFavs(bool sd, ProductModel product) async {
    try {
      if (sd) {
        try {
          await store
              .collection('Favs')
              .doc(auth.currentUser!.uid)
              .collection('MyFavs')
              .doc(product.id)
              .set(product.toJson());
        } catch (e) {}
      } else {
        try {
          await store
              .collection('Favs')
              .doc(auth.currentUser!.uid)
              .collection('MyFavs')
              .doc(product.id)
              .delete();
        } catch (e) {}
      }
    } catch (e) {}
  }

  bool isLoadingProduct = false;
  getFavs() async {
    favProducts = [];
    List<ProductModel> loadedFavProducts = [];

    try {
      isLoadingProduct = true;
      var data = await store
          .collection('Favs')
          .doc(auth.currentUser!.uid)
          .collection('MyFavs')
          .get();

      for (var e in data.docs) {
        loadedFavProducts.add(ProductModel.fromJson(e.data()));
      }

      favProducts = loadedFavProducts;
      isLoadingProduct = false;
      update();
    } catch (e) {
      isLoadingProduct = false;
      update();
    }
  }
}
