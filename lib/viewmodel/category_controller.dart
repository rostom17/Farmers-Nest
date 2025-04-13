import 'package:farmers_nest/model/dummy_data.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  CategoryController({this.categoryId = 2001});

  int categoryId;
  List<Map<String, dynamic>> itemByCategory = [];

  @override
  void onInit() {
    super.onInit();
    itemByCategory =
        ProductData.productData
            .where((item) => item['category']['cId'] == categoryId)
            .toList();
  }

  List<Map<String,dynamic>> get categoryItem=>  itemByCategory;
}
