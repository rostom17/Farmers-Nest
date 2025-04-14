import 'package:farmers_nest/viewmodel/profile_controller.dart';
import 'package:get/get.dart';
import 'package:farmers_nest/viewmodel/bottom_nav_controller.dart';
import 'package:farmers_nest/viewmodel/category_controller.dart';

class Binder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationController());
    Get.put(CategoryController());
    Get.put(ProfileController());
  }
}
