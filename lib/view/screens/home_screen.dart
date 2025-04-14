import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:farmers_nest/view/widgets/home_screen_slider.dart';
import 'package:farmers_nest/view/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              ),
              const SizedBox(height: 16),
              _buildProductCard(),
              const SizedBox(height: 16),
              _buildEachSection(
                context: context,
                sectionName: "New Arrival",
                buttonName: "See All",
              ),
              const SizedBox(height: 16),
              _buildProductCard(),
              Text("hello World"),
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
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(sectionName, style: Theme.of(context).textTheme.titleLarge),
        TextButton(onPressed: () {}, child: Text(buttonName)),
      ],
    );
  }

  SizedBox _buildProductCard() {
    return SizedBox(
      height: 250,
      width: double.maxFinite,
      child: FutureBuilder(
        future: FirebaseFirestore.instance.collection("ProductDetails").get(),
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
        Icon(CupertinoIcons.bell),
        const SizedBox(width: 12),
        Icon(CupertinoIcons.list_bullet),
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
