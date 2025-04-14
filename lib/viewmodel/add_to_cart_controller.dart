import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddToCartController {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> addToCart(
    Map<String, dynamic> productDetails,
    int itemCount,
  ) async {
    if (user == null) {
      throw Exception("User not found");
    }
    final cartItem = FirebaseFirestore.instance
        .collection("Carts")
        .doc(user?.uid)
        .collection('items')
        .doc(productDetails['product_name']);
    await cartItem.set({
      'product_name': productDetails['product_name'],
      'price': productDetails['price'],
      'image': productDetails['image'],
      'quantity': itemCount,
    });
  }
}
