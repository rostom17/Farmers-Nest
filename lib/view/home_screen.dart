import 'package:farmers_nest/core/color_pallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildSlider(),
              SizedBox(
                height: 100,
                width: double.maxFinite,
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: "Home"),
                    Tab(text: "Categories"),
                    Tab(text: "Profile"),
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(color: Colors.red),
                    Container(color: Colors.green),
                    Container(color: Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

  Container _buildSlider() {
    return Container(
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorPallet.sliderColor,
      ),
    );
  }
}
