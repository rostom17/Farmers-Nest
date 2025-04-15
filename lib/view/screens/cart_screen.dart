import 'package:farmers_nest/core/color_pallet.dart';
import 'package:farmers_nest/viewmodel/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartController = CartController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _cartController.fetchCartItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Lottie.asset("assets/lottie/empty.json"),
                    );
                  }
                  return _itemBuilder(snapshot);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
        child: Container(
          height: 170,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [ColorPallet.productColor1, ColorPallet.productColor2],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: _cartController.fetchTotalCartPrice(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("Add Something to Cart"));
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Toal Price"),
                        Text("\$${snapshot.data}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Discount"),
                        Text("\$${(snapshot.data! * .15).toStringAsFixed(2)}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Final Price",
                          style: TextStyle(
                            fontSize: 20,
                            color: ColorPallet.mainColorTheme,
                          ),
                        ),
                        Text(
                          "\$${(snapshot.data! * .85).toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 23,
                            color: ColorPallet.mainColorTheme,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        _cartController.clearUserCart();
                        await Future.delayed(Duration(microseconds: 400));
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("Order Placed")));
                      },
                      child: Text("Pace Order"),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  ListView _itemBuilder(AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
    return ListView.separated(
      itemBuilder: (context, index) {
        var item = snapshot.data![index];
        return Card(
          child: SizedBox(
            height: 100,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  _buildImage(item),
                  const SizedBox(width: 20),
                  _productNameAndPrice(item),
                  const Spacer(),
                  _productQuantity(item, context),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: snapshot.data!.length,
    );
  }

  Column _productNameAndPrice(Map<String, dynamic> item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('${item['product_name']}'),
        Text(
          '\$${item['price']}',
          style: const TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row _productQuantity(Map<String, dynamic> item, BuildContext context) {
    return Row(
      children: [
        IconButton.outlined(
          style: IconButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        const SizedBox(width: 5),
        Text(
          "${item['quantity']}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 5),
        IconButton.outlined(
          style: IconButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }

  Container _buildImage(Map<String, dynamic> item) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child:
          item['image'] != null && item['image'] != ""
              ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  '${item['image']}',
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Center(child: Icon(Icons.broken_image)),
                ),
              )
              : Center(child: Icon(Icons.broken_image)),
    );
  }
}
