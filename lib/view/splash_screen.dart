import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clinic/controller/auth_controller.dart';
import 'package:clinic/view/home_view.dart';
import 'package:clinic/view/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.slideTransition,
      splashIconSize: 250,
      duration: 3000,
      splash: SvgPicture.asset("assets/svg/logo.svg"),
      nextScreen: FirebaseAuth.instance.currentUser?.uid == null
          ? SignupView()
          : const HomeView(),
      backgroundColor: const Color(0xff595CFF),
    );
  }
}
