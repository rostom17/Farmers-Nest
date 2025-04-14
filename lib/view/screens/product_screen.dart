import 'package:farmers_nest/core/color_pallet.dart';
import 'package:farmers_nest/model/dummy_data.dart';
import 'package:farmers_nest/viewmodel/cart_controller.dart';
import 'package:farmers_nest/viewmodel/favourite_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.productDetails, super.key});

  final Map<String, dynamic> productDetails;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _addtoCartController = CartController();
  final _favouriteItemController = FavouriteItemController();

  void addToCart() {
    _addtoCartController.addToCart(widget.productDetails, 1);
  }

  void addtoFavourite() {
    _favouriteItemController.addToFavourite(widget.productDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _productTitleSection(context),
                  _ratingFavouriteSection(),
                  const SizedBox(height: 10),
                  Text("${widget.productDetails['description']}"),
                  const SizedBox(height: 20),
                  Text(
                    "Similar Category Product",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  _buildSimilarCategoryItem(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: ElevatedButton(onPressed: addToCart, child: Text("Add to Cart")),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 350,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: '${widget.productDetails['image']}',
          fit: BoxFit.cover,
          errorWidget:
              (context, url, error) => Center(child: Icon(Icons.broken_image)),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
      leadingWidth: 80,
    );
  }

  Row _productTitleSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${widget.productDetails['product_name']}",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          '\$${widget.productDetails['price']}',
          style: TextStyle(
            color: ColorPallet.mainColorTheme,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row _ratingFavouriteSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          width: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) =>
                    const Icon(Icons.star, color: Colors.orange),
            itemCount: 4,
          ),
        ),
        SizedBox(
          width: 50,
          child: IconButton(
            onPressed: addtoFavourite,
            icon: const Icon(CupertinoIcons.heart, color: Colors.red),
          ),
        ),
      ],
    );
  }

  SizedBox _buildSimilarCategoryItem() {
    return SizedBox(
      height: 620,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) => _itemBuilder(context, index),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 180,
                width: double.maxFinite,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      ProductData.productData[index]['image'] != ""
                          ? Image.network(
                            "${ProductData.productData[index]['image']}",
                            fit: BoxFit.cover,
                          )
                          : Center(child: Icon(Icons.broken_image)),
                ),
              ),
              Text(
                "${ProductData.productData[index]['productName']}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange),
                  const SizedBox(width: 5),
                  Text('${ProductData.productData[index]['ratings']}'),
                ],
              ),
              Text(
                '\$${ProductData.productData[index]['price']}',
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
