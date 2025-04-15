import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_nest/view/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future:
              FirebaseFirestore.instance
                  .collection("ProductDetails")
                  .where("category", isEqualTo: "Spices")
                  .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData && snapshot.data != null) {
              return const Center(child: Text("No Data"));
            }

            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  child: ProductCard(
                    product: snapshot.data!.docs[index].data(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}