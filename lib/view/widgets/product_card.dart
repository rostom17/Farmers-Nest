import 'package:farmers_nest/core/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({required this.product, super.key});

  final Map<String, dynamic> product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void goToProductScreen() {
    Get.toNamed("/productScreen", arguments: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goToProductScreen,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorPallet.productColor2),
        ),
        padding: EdgeInsets.all(8),
        child: Stack(
          children: [
            _buildImage(),
            widget.product['discount'] != null && widget.product['discount'] > 0
                ? _buildDiscount(widget.product['discount'])
                : Text(""),

            _buildProductName(context),
            _buildProductUnit(context),
            Positioned(
              bottom: 10,
              child: Text(
                "\$${widget.product['price']}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            _buildAddToCartButton(),
          ],
        ),
      ),
    );
  }

  Positioned _buildProductUnit(BuildContext context) {
    return Positioned(
      top: 155,
      child: Text(
        "${widget.product['quantity']} ${widget.product['quantity_unit']}",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Positioned _buildProductName(BuildContext context) {
    return Positioned(
      top: 130,
      child: Text(
        "${widget.product['product_name']}",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Positioned _buildAddToCartButton() {
    return Positioned(
      bottom: 10,
      right: 1,
      child: SizedBox(
        height: 40,
        width: 40,
        child: FloatingActionButton(
          heroTag: UniqueKey(),
          elevation: 0,
          backgroundColor: ColorPallet.mainColorTheme,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Positioned _buildDiscount(int discount) {
    return Positioned(
      top: 2,
      left: 5,
      child: Text("$discount% off", style: TextStyle(color: Colors.pink)),
    );
  }

  SizedBox _buildImage() {
    return SizedBox(
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child:
            widget.product['image'] != null
                ? Image.network(
                  widget.product["image"],
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.clear,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Center(child: Icon(Icons.broken_image)),
                )
                : Center(child: Icon(Icons.broken_image)),
      ),
    );
  }
}
