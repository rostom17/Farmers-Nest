import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartController {
  Future<void> addToCart(
    Map<String, dynamic> productDetails,
    int itemCount,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
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

  Future<List<Map<String, dynamic>>> fetchCartItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("No user credential");
    }
    final data =
        await FirebaseFirestore.instance
            .collection('Carts')
            .doc("${user?.uid}")
            .collection('items')
            .get();

    var list = data.docs.map((doc) => doc.data()).toList();

    return list;
  }

  Future<double> fetchTotalCartPrice() async {
    final user = FirebaseAuth.instance.currentUser;
    double total = 0;
    if (user == null) throw Exception("User not Logged In");
    final data =
        await FirebaseFirestore.instance
            .collection("Carts")
            .doc(user?.uid)
            .collection("items")
            .get();
    for (var doc in data.docs) {
      var x = doc.data();
      double pPrice = x['price'] ?? 0;
      int qty = x['quantity'] ?? 1;
      //print("price : $pPrice\nquantity: $qty");
      total += pPrice * qty;
    }
    return total;
  }

  Future<void> clearUserCart() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final cartItemsRef = FirebaseFirestore.instance
        .collection('Carts')
        .doc(user.uid)
        .collection('items');

    final snapshot = await cartItemsRef.get();

    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }
}
