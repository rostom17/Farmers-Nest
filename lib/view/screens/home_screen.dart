import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_nest/view/screens/product_list_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:farmers_nest/view/widgets/home_screen_slider.dart';
import 'package:farmers_nest/view/widgets/product_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> logOut() async {
    try {
      FirebaseAuth.instance.signOut();
      Get.offAllNamed("/loginScreen");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${e.message}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              const SizedBox(height: 16),
              HomePageSlider(),
              const SizedBox(height: 16),
              _buildEachSection(
                context: context,
                sectionName: "Best Selling",
                buttonName: "See All",
                condition: "Best Selling",
              ),
              const SizedBox(height: 16),
              _buildProductCard(filed: "remark", condition: "Best Selling"),
              const SizedBox(height: 16),
              _buildEachSection(
                context: context,
                sectionName: "New Arrival",
                buttonName: "See All",
                condition: "Organic",
              ),
              const SizedBox(height: 16),
              _buildProductCard(filed: "remark", condition: "Organic"),
              const SizedBox(height: 16),
              _buildEachSection(
                context: context,
                sectionName: "Discounted Product",
                buttonName: "See All",
              ),
              const SizedBox(height: 16),
              _buildDiscountedProduct(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildEachSection({
    required BuildContext context,
    required String sectionName,
    required String buttonName,
    String condition = "Best Selling",
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(sectionName, style: Theme.of(context).textTheme.titleLarge),
        TextButton(
          onPressed: () {
            Get.to(
              () => ProductListScreen(field: "remark", condition: sectionName),
            );
          },
          child: Text(buttonName),
        ),
      ],
    );
  }

  SizedBox _buildProductCard({
    required String filed,
    required String condition,
  }) {
    return SizedBox(
      height: 250,
      width: double.maxFinite,
      child: FutureBuilder(
        future:
            FirebaseFirestore.instance
                .collection("ProductDetails")
                .where(filed, isEqualTo: condition)
                .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("No Data"));
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) =>
                    ProductCard(product: snapshot.data!.docs[index].data()),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }

  Widget _buildDiscountedProduct() {
    return SizedBox(
      height: 250,
      width: double.maxFinite,
      child: FutureBuilder(
        future:
            FirebaseFirestore.instance
                .collection("ProductDetails")
                .orderBy("discount", descending: true)
                .limit(5)
                .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("No Data"));
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) =>
                    ProductCard(product: snapshot.data!.docs[index].data()),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 12, right: 0, top: 8, bottom: 8),
        child: SvgPicture.asset(
          "assets/images/FarmersNestLogo.svg",
          fit: BoxFit.contain,
        ),
      ),
      title: Text("FARMERS NEST"),
      centerTitle: false,
      actions: [
        Badge(
          backgroundColor: Colors.pink,
          label: Text("2", style: TextStyle(color: Colors.white)),
          child: Icon(CupertinoIcons.bell, size: 32, color: Colors.black),
        ),
        const SizedBox(width: 12),
        IconButton(
          onPressed: logOut,
          icon: Icon(
            CupertinoIcons.square_arrow_right,
            size: 32,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  SearchBar _buildSearchBar() {
    return SearchBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(CupertinoIcons.search),
      ),
      hintText: "Search for products",
      trailing: [Icon(CupertinoIcons.camera), const SizedBox(width: 16)],
    );
  }
}
