import 'package:clinic/controller/auth_controller.dart';
import 'package:clinic/controller/cart_ctr.dart';
import 'package:clinic/controller/home_controller.dart';
import 'package:clinic/view/favorite_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'cart_view.dart';
import 'products_view.dart';
import 'profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final authController = Get.put(AuthController());
  final homeController = Get.put(HomeController());
  final gg = Get.put(CartCtr())..getCart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: homeController.pageController,
          onPageChanged: (index) {
            homeController.selectedIndex = index;
          },
          children: <Widget>[
            const ProductsView(),
            CartView(),
            const FavoriteView(),
            const ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (_) => Container(
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 13, 15, 115), width: 2))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            unselectedItemColor: const Color.fromARGB(255, 25, 26, 90),
            iconSize: 35,
            backgroundColor: const Color(0xff595CFF),
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                backgroundColor: Color(0xff595CFF),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Favotire',
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Profile',
                backgroundColor: Color(0xff1A1B69),
              ),
            ],
            currentIndex: homeController.selectedIndex,
            selectedItemColor: Colors.white,
            onTap: homeController.onItemTapped,
          ),
        ),
      ),
    );
  }
}
