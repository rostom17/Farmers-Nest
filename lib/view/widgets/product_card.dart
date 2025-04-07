import 'package:farmers_nest/core/color_pallet.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: ColorPallet.backGroundColor2,
      onTap: () {},
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
            product['discount'] > 0 ? _buildDiscount() : Text(""),

            _buildProductName(context),
            _buildProductUnit(context),
            Positioned(
              bottom: 10,
              child: Text(
                "\$${product['price']}",
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
        "${product['quantity']} ${product['quantity_unit']}",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Positioned _buildProductName(BuildContext context) {
    return Positioned(
      top: 130,
      child: Text(
        "${product['productName']}",
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

  Positioned _buildDiscount() {
    return Positioned(
      top: 2,
      left: 5,
      child: Text(
        "${(product['discount'] * 100).toInt()}% off",
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  SizedBox _buildImage() {
    return SizedBox(
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          product["image"],
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.clear,
          errorBuilder:
              (context, error, stackTrace) =>
                  Center(child: Icon(Icons.broken_image)),
        ),
      ),
    );
  }
}
