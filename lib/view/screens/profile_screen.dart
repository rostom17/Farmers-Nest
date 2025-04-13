import 'package:farmers_nest/core/color_pallet.dart';
import 'package:farmers_nest/model/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void onPressedEditProfileButton() {
    Get.toNamed("/userProfile");
  }

  @override
  Widget build(BuildContext context) {
    final myThemeMode = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _sliverAppBar(myThemeMode),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Mr Panda",
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
                    "dummyemail@gmail.com",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  _voucherCard(context),
                  const SizedBox(height: 20),
                  Text(
                    "Favourite",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          ..._favouriteSection(context),
        ],
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

  SliverAppBar _sliverAppBar(Brightness myThemeMode) {
    return SliverAppBar(
      expandedHeight: 380,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://static.wikia.nocookie.net/kungfupanda/images/7/73/KFP3-promo-po4.jpg/revision/latest?cb=20150726165358',
          fit: BoxFit.fill,
          cacheHeight: 380,
          cacheWidth: double.maxFinite.toInt(),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                myThemeMode == Brightness.light ? Colors.white : Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _favouriteSection(BuildContext context) {
    return ProductData.productData
        .map(
          (item) => SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: SizedBox(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 110,
                          width: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child:
                                item['image'] != ""
                                    ? Image.network(
                                      item['image'],
                                      fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.clear,
                                    )
                                    : Center(child: Icon(Icons.broken_image)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                item['productName'].toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),

                              Text(
                                "${item['description']}",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                "\$ ${item['price']}",
                                style: const TextStyle(
                                  color: ColorPallet.mainColorTheme,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart_checkout),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
