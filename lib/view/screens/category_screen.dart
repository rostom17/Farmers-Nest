import 'package:farmers_nest/viewmodel/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _categoryController = Get.find<CategoryController>();
  List<Map<String, dynamic>> _uniqueCategoryList = [];

  @override
  void initState() {
    _uniqueCategoryList =
        {
          for (var item in _categoryController.getCategoryList)
            item['cId']: item,
        }.values.toList();
    print("helo rostom \n\n\n");
    print(_uniqueCategoryList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Wish List Screen")));
  }
}
