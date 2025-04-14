import 'package:farmers_nest/viewmodel/favourite_item_controller.dart';
import 'package:farmers_nest/viewmodel/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileContoller = Get.find<ProfileController>();
  final _favouriteItemController = FavouriteItemController();

  void onPressedEditProfileButton() {
    Get.toNamed("/userProfile");
  }

  @override
  void initState() {
    _profileContoller.getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return CustomScrollView(
            slivers: [
              _sliverAppBar(controller.userInfo['image']),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${_profileContoller.userInfo['name']}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: onPressedEditProfileButton,
                            icon: const Icon(
                              CupertinoIcons.pencil_circle,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${_profileContoller.userInfo['email']}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20),
                      _voucherCard(context),
                      const SizedBox(height: 20),
                      Text(
                        "Favourite",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      FutureBuilder(
                        future: _favouriteItemController.fetchFavouriteItems(),

                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text("No Favourites Found"),
                            );
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var item = snapshot.data![index];

                              //
                              return _buildFavouriteItemCard(item);
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Card _buildFavouriteItemCard(Map<String, dynamic> item) {
    return Card(
      child: Container(
        height: 100,
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: 89,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                      item["image"] != null && item['image'] != ""
                          ? Image.network(
                            item['image'],
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    Center(child: Icon(Icons.broken_image)),
                          )
                          : Center(child: Icon(Icons.broken_image)),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${item["product_name"]}"),
                  Text("${item["price"]}"),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.delete, color: Colors.red),
                    ),
                  ),

                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.shopping_cart,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _voucherCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: Row(
          children: [
            const SizedBox(width: 12),
            const Icon(
              Icons.card_giftcard_rounded,
              size: 50,
              color: Colors.orange,
            ),
            const SizedBox(width: 20),
            Text(
              "Your have 3 voucher",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _sliverAppBar(String? imageLink) {
    return SliverAppBar(
      expandedHeight: 380,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background:
            imageLink != null && imageLink != ""
                ? Image.network(
                  imageLink,
                  fit: BoxFit.fill,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Center(child: CircleAvatar()),
                  cacheHeight: 380,
                  cacheWidth: double.maxFinite.toInt(),
                )
                : Center(child: CircleAvatar()),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
        ),
      ),
    );
  }
}
