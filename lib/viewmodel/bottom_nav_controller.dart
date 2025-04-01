import 'package:farmers_nest/view/cart_screen.dart';
import 'package:farmers_nest/view/home_screen.dart';
import 'package:farmers_nest/view/profile_screen.dart';
import 'package:farmers_nest/view/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    WishListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void onChnage(int index) {
    selectedIndex = index;
    update();
  }
}
