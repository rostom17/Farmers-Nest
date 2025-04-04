import 'package:farmers_nest/core/color_pallet.dart';
import 'package:farmers_nest/model/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildSlider(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(onPressed: () {}, child: Text("See All")),
                ],
              ),
              SizedBox(
                height: 250,
                width: double.maxFinite,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.all(8),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                ProductData.productData[index]["image"],
                                colorBlendMode: BlendMode.clear,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        Center(child: Icon(Icons.broken_image)),
                              ),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: ProductData.productData.length,
                ),
              ),
              Text("he  "),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 12, right: 0, top: 8, bottom: 8),
        child: SvgPicture.asset(
          "assets/images/FarmersNestLogo.svg",
          fit: BoxFit.contain,
        ),
      ),
      title: Text("FARMERS NEST"),
      centerTitle: false,
      actions: [
        Icon(CupertinoIcons.bell),
        const SizedBox(width: 12),
        Icon(CupertinoIcons.list_bullet),
        const SizedBox(width: 12),
      ],
    );
  }

  SearchBar _buildSearchBar() {
    return SearchBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(CupertinoIcons.search),
      ),
      hintText: "Search for products",
      trailing: [Icon(CupertinoIcons.camera), const SizedBox(width: 16)],
    );
  }

  Container _buildSlider() {
    return Container(
      height: 120,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorPallet.sliderColor,
      ),
    );
  }
}
