import 'package:farmers_nest/model/dummy_data.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  CategoryController({this.categoryId = 2001});

  int categoryId;
  List<Map<String, dynamic>> cateogryList = [];

  @override
  void onInit() {
    cateogryList =
        ProductData.productData.map((element) {
          return {
            "cId": element['category']['cId'],
            "categoryName": element['category']['categoryName'],
          };
        }).toList();

    // final uniqueCategories =
    //     {for (var item in cateogryList) item['cId']: item}.values.toList();
    // print(uniqueCategories);

    super.onInit();
  }

  List<Map<String, dynamic>> get getCategoryList => cateogryList;
}
//