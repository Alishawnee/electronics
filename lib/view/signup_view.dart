import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import 'login_view.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff595CFF),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const Spacer(flex: 10),
            Flexible(
              flex: !KeyboardVisibilityProvider.isKeyboardVisible(context)
                  ? 60
                  : 0,
              child: AnimatedCrossFade(
                crossFadeState:
                    !KeyboardVisibilityProvider.isKeyboardVisible(context)
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                duration: const Duration(seconds: 2),
                secondChild: Container(),
                firstChild: SvgPicture.asset("assets/svg/logo.svg"),
              ),
            ),
            const Spacer(flex: 3),
            Flexible(
              flex: !KeyboardVisibilityProvider.isKeyboardVisible(context)
                  ? 20
                  : 0,
              child: AnimatedCrossFade(
                crossFadeState:
                    !KeyboardVisibilityProvider.isKeyboardVisible(context)
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                duration: const Duration(seconds: 2),
                secondChild: Container(),
                firstChild: const Center(
                  child: Text(
                    "Electronics",
                    style: TextStyle(color: Colors.white, fontSize: 38),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Flexible(
                flex: 15,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffE8E8E8),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: TextFormField(
                    controller: authController.nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Name",
                      labelStyle: TextStyle(color: Color(0xff14154F)),
                      prefixIcon: Icon(FontAwesomeIcons.solidUser,
                          color: Color(0xff14154F)),
                    ),
                  ),
                )),
            const Spacer(flex: 5),
            Flexible(
                flex: 15,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffE8E8E8),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: TextFormField(
                    controller: authController.phoneController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Phone",
                      labelStyle: TextStyle(color: Color(0xff14154F)),
                      prefixIcon: Icon(FontAwesomeIcons.phone,
                          color: Color(0xff14154F)),
                    ),
                  ),
                )),
            const Spacer(flex: 5),
            Flexible(
                flex: 15,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffE8E8E8),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: TextFormField(
                    controller: authController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Email",
                      labelStyle: TextStyle(color: Color(0xff14154F)),
                      prefixIcon: Icon(FontAwesomeIcons.solidEnvelope,
                          color: Color(0xff14154F)),
                    ),
                  ),
                )),
            const Spacer(flex: 5),
            Flexible(
                flex: 15,
                child: GetBuilder<AuthController>(
                    builder: (_) => Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffE8E8E8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: TextFormField(
                            controller: authController.passWordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: authController.obscureText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Password",
                              labelStyle:
                                  const TextStyle(color: Color(0xff14154F)),
                              prefixIcon: const Icon(FontAwesomeIcons.lock,
                                  color: Color(0xff14154F)),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    authController.changeObscureText();
                                  },
                                  icon: Icon(
                                      authController.obscureText
                                          ? FontAwesomeIcons.solidEye
                                          : FontAwesomeIcons.solidEyeSlash,
                                      color: const Color(0xff14154F))),
                            ),
                          ),
                        ))),
            const Spacer(flex: 5),
            Flexible(
                flex: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xff595CFF)),
                    child: GetBuilder<AuthController>(
                      builder: (_) => MaterialButton(
                        onPressed: () async {
                          authController.signUp(context);
                        },
                        child: authController.isLogin
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white))
                            : const Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                )),
            const Spacer(flex: 5),
            const Divider(
              thickness: 1,
              height: 30,
              color: Color(0xff595CFF),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    " do you have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => LoginView());
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
