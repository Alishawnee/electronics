import 'package:clinic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    authController.getInfoUser();
    super.initState();
  }

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => authController.load
          ? Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Color(0xff595CFF),
                strokeWidth: 10,
              ),
            )
          : Container(
              color: Colors.white,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: Get.height * 0.38,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        color: Color(0xff595CFF)),
                    child: SvgPicture.asset('assets/svg/profile.svg'),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: double.infinity,
                        margin: const EdgeInsets.only(left: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              authController.userModel!.name!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xff14154F),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SelectableText(
                              authController.userModel!.phone!,
                              style: const TextStyle(
                                color: Color(0xff14154F),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              authController.userModel!.email!,
                              style: const TextStyle(
                                color: Color(0xff14154F),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color(0xff595CFF)),
                                child: MaterialButton(
                                  onPressed: () async {
                                    authController.logout();
                                  },
                                  child: const Text(
                                    "Log Out",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
