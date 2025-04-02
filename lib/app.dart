import 'package:farmers_nest/binder.dart';
import 'package:farmers_nest/core/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:farmers_nest/view/bottom_nav_screen.dart';

class FarmersNest extends StatelessWidget {
  const FarmersNest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _lightTheme(),
      initialBinding: Binder(),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => BottomNavigationScreen())],
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,

      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),

      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStatePropertyAll(ColorPallet.whileColor),
        elevation: WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        side: WidgetStatePropertyAll(BorderSide(color: Colors.grey.shade800)),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: ColorPallet.mainColorTheme,
        indicatorColor: Colors.transparent,
        iconTheme: WidgetStatePropertyAll(IconThemeData(color: Colors.black)),
        overlayColor: WidgetStatePropertyAll(ColorPallet.mainColorTheme),
        elevation: 5,
        labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black)),
        height: 70,
        indicatorShape: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: ColorPallet.mainColorTheme),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
