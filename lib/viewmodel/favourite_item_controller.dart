import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavouriteItemController {
  Future<void> addToFavourite(Map<String, dynamic> productDetails) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("User not found");
    }
    final cartItem = FirebaseFirestore.instance
        .collection("Favourites")
        .doc(user?.uid)
        .collection('items')
        .doc(productDetails['product_name']);
    await cartItem.set({
      'product_name': productDetails['product_name'],
      'price': productDetails['price'],
      'image': productDetails['image'],
    });
  }

  Future<List<Map<String, dynamic>>> fetchFavouriteItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("No user credential");
    }
    final data =
        await FirebaseFirestore.instance
            .collection('Favourites')
            .doc("${user?.uid}")
            .collection('items')
            .get();
    var list = data.docs.map((doc) => doc.data()).toList();
    return list;
  }
}
