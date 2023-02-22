import 'package:clinic/model/user.dart';
import 'package:clinic/view/home_view.dart';
import 'package:clinic/view/signup_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'cart_ctr.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  UserModel? userModel;
  bool load = false;
  getInfoUser() async {
    try {
      load = true;
      var data = await FirebaseFirestore.instance
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .get();
      userModel = UserModel.fromJson(data.data()!);
      load = false;
      update();
    } catch (e) {
      load = false;
      update();
    }
  }

  void removeTextControllers() {
    obscureText = true;
    nameController.clear();
    emailController.clear();
    passWordController.clear();
    phoneController.clear();
  }

  bool obscureText = true;
  void changeObscureText() {
    obscureText = !obscureText;
    update();
  }

  signUp(context) async {
    try {
      isLogin = true;
      update();
      await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passWordController.text.trim());
      final UserModel userModel = UserModel(
          name: nameController.text,
          id: auth.currentUser!.uid,
          email: emailController.text,
          phone: phoneController.text);
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .set(userModel.toJson());
      isLogin = false;
      update();
      Fluttertoast.showToast(msg: "successfully registered.");
      FocusScope.of(context).unfocus();
      Get.offAll(() => const HomeView());

      removeTextControllers();
    } on FirebaseAuthException catch (e) {
      isLogin = false;
      update();
      switch (e.code) {
        case "email-already-in-use":
          return Fluttertoast.showToast(
            msg: "There is already one registered with this email address.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        case "invalid-email":
          return Fluttertoast.showToast(
            msg: "The email address is incorrect.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        default:
          return Fluttertoast.showToast(
            msg: "Login failed. Please try again.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
      }
    }
  }

  bool isLogin = false;
  login(context) async {
    try {
      isLogin = true;
      update();

      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passWordController.text.trim(),
      );

      Fluttertoast.showToast(
        msg: "Successfully logged in...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      isLogin = false;
      update();
      FocusScope.of(context).unfocus();
      Get.offAll(() => const HomeView());
      removeTextControllers();
    } on FirebaseAuthException catch (e) {
      isLogin = false;
      update();
      switch (e.code) {
        case "wrong-password":
          return Fluttertoast.showToast(
            msg: "The password is incorrect.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        case "user-not-found":
          return Fluttertoast.showToast(
            msg: "No such user was found.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        case "invalid-email":
          return Fluttertoast.showToast(
            msg: "Email address is incorrect.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
      }
    }
  }

  logout() async {
    try {
      await auth.signOut();
      Get.offAll(() => SignupView());
      Get.put(CartCtr()).items = [];
      removeTextControllers();
    } on FirebaseAuthException catch (_) {
      Fluttertoast.showToast(
        msg: "A problem occurred. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
    Fluttertoast.showToast(
      msg: "Successfully logged out...",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  void onInit() {
    getInfoUser();
    super.onInit();
  }
}
