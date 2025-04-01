import 'package:farmers_nest/viewmodel/bottom_nav_controller.dart';
import 'package:get/get.dart';

class Binder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationController());
  }
}
