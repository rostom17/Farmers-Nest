import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: SizedBox(
              width: double.maxFinite,
              height: 100,
              child: Image.network(
                product["image"],
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.clear,
                errorBuilder:
                    (context, error, stackTrace) =>
                        Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
