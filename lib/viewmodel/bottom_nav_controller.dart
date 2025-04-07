import 'package:farmers_nest/view/screens/cart_screen.dart';
import 'package:farmers_nest/view/screens/home_screen.dart';
import 'package:farmers_nest/view/screens/profile_screen.dart';
import 'package:farmers_nest/view/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void onChnage(int index) {
    selectedIndex = index;
    update();
  }
}
