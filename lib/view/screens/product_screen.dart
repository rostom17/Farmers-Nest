import 'package:flutter/material.dart';
import 'package:flutter/Cupertino.dart';
import 'package:get/get.dart';

// class ProductScreen extends StatefulWidget {
//   const ProductScreen({super.key});
//   @override
//   State<ProductScreen> createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           _sliverAppBar(),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _foodNameSection(context),
//                   _rating_FavouriteSection(),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Lasagna is a beloved Italian dish known for its rich layers of flavor. It features wide, flat pasta sheets layered with a hearty meat sauce, creamy ricotta cheese, and a rich béchamel sauce. The layers are often topped with grated Parmesan cheese and baked until golden brown. Lasagna is a comforting and satisfying meal, perfect for sharing with family and friends. The combination of textures and flavors, from the tender pasta to the savory sauce, makes it a timeless classic.",
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     "Similar Category Food",
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   const SizedBox(height: 20),
//                   _buildSimilarCategoryItem(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.transparent,
//         shadowColor: Colors.transparent,
//         surfaceTintColor: Colors.transparent,
//         elevation: 3,
//         child: ElevatedButton(
//           onPressed: () {},
//           child: const Text("Add to cart"),
//         ),
//       ),
//     );
//   }

//   SizedBox _buildSimilarCategoryItem() {
//     return SizedBox(
//       height: 620,
//       child: GridView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: 4,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 8,
//           mainAxisSpacing: 8,
//           childAspectRatio: 2 / 3,
//         ),
//         itemBuilder: (context, index) => _itemBuilder(context, index),
//       ),
//     );
//   }

//   Widget _itemBuilder(BuildContext context, int index) {
//     return InkWell(
//       onTap: () {},
//       child: SizedBox(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 height: 180,
//                 width: double.maxFinite,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                   image: DecorationImage(
//                     image: NetworkImage(""),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Text("", style: Theme.of(context).textTheme.titleSmall),
//               Row(
//                 children: [
//                   const Icon(Icons.star, color: Colors.orange),
//                   const SizedBox(width: 5),
//                   Text(''),
//                 ],
//               ),
//               Text(
//                 '',
//                 style: const TextStyle(
//                   color: Colors.greenAccent,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Row _rating_FavouriteSection() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           height: 50,
//           width: 200,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemBuilder:
//                 (context, index) =>
//                     const Icon(Icons.star, color: Colors.orange),
//             itemCount: 4,
//           ),
//         ),
//         SizedBox(
//           width: 50,
//           child: IconButton(
//             onPressed: () {},
//             icon: const Icon(CupertinoIcons.heart, color: Colors.red),
//           ),
//         ),
//       ],
//     );
//   }

//   Row _foodNameSection(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(""),
//         const Text(
//           '\$15.5',
//           style: TextStyle(
//             color: Colors.greenAccent,
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }

//   SliverAppBar _sliverAppBar() {
//     return SliverAppBar(
//       expandedHeight: 350,
//       pinned: true,
//       flexibleSpace: FlexibleSpaceBar(
//         background: Image.network('', fit: BoxFit.cover),
//       ),
//       bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(0.0),
//         child: Container(
//           height: 32,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(32),
//               topRight: Radius.circular(32),
//             ),
//           ),
//         ),
//       ),
//       leading: IconButton(
//         onPressed: () {
//           Get.back();
//         },
//         icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//       ),
//       leadingWidth: 80,
//     );
//   }
// }

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
