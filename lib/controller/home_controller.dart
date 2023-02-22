import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    update();
  }

  final PageController _pageController = PageController(initialPage: 0);
  get pageController => _pageController;

  void onItemTapped(int index) {
    _selectedIndex = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
    update();
  }
}
