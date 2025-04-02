import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:farmers_nest/viewmodel/bottom_nav_controller.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final _bottomNavigationController = Get.find<BottomNavigationController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      builder: (_) {
        return Scaffold(
          body:
              _bottomNavigationController.screens[_bottomNavigationController
                  .selectedIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 16,
              right: 16,
              top: 5,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: NavigationBar(
                selectedIndex: _bottomNavigationController.selectedIndex,
                onDestinationSelected: _bottomNavigationController.onChnage,
                destinations: [
                  NavigationDestination(
                    icon: Icon(CupertinoIcons.home),
                    label: "Home",
                  ),
                  NavigationDestination(
                    icon: Icon(CupertinoIcons.heart),
                    label: "Wish List",
                  ),
                  NavigationDestination(
                    icon: Icon(CupertinoIcons.shopping_cart),
                    label: "Cart",
                  ),
                  NavigationDestination(
                    icon: Icon(CupertinoIcons.person),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
