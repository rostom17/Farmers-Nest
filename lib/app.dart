import 'package:farmers_nest/binder.dart';
import 'package:farmers_nest/core/color_pallet.dart';
import 'package:farmers_nest/view/screens/auth/login_screen.dart';
import 'package:farmers_nest/view/screens/auth/registration_screen.dart';
import 'package:farmers_nest/view/screens/product_screen.dart';
import 'package:farmers_nest/view/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:farmers_nest/view/screens/bottom_nav_screen.dart';

class FarmersNest extends StatelessWidget {
  const FarmersNest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _lightTheme(),
      initialBinding: Binder(),
      initialRoute:
          FirebaseAuth.instance.currentUser != null ? "/" : "/loginScreen",
      getPages: [
        GetPage(name: "/", page: () => BottomNavigationScreen()),
        GetPage(name: "/userProfile", page: () => UserProfileScreen()),
        GetPage(name: "/loginScreen", page: () => LoginScreen()),
        GetPage(name: "/registrationScreen", page: () => RegistrationScreen()),
      ],
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
        backgroundColor: ColorPallet.offWhileColor,
        //surfaceTintColor: ColorPallet.mainColorTheme,
        //indicatorColor: Colors.transparent,
        indicatorColor: Colors.greenAccent.withAlpha(50),
        iconTheme: WidgetStatePropertyAll(IconThemeData(color: Colors.black)),
        overlayColor: WidgetStatePropertyAll(ColorPallet.mainColorTheme),
        elevation: 5,
        labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black)),
        indicatorShape: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: ColorPallet.mainColorTheme),
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      cardTheme: CardThemeData(color: ColorPallet.productColor2),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPallet.mainColorTheme,
          foregroundColor: Colors.white,
          fixedSize: Size.fromWidth(double.maxFinite),
          shadowColor: Colors.grey,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorPallet.mainColorTheme,
        ),
      ),

      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),

        bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(fontSize: 14, color: Colors.grey.shade800),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
