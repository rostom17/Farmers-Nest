import 'package:farmers_nest/core/color_pallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildTopGradiantDesign(),
            _buildAppDrawerFuntionality(),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * .2),
                  _buildProfileImage(),
                  const SizedBox(height: 20),
                  _buildRow(context, "Name", CupertinoIcons.person),
                  _buildDivider(),
                  _buildRow(context, "Phone Number", Icons.phone_android_sharp),
                  _buildDivider(),
                  _buildRow(context, "Address", Icons.apartment),
                  _buildDivider(),
                  _buildRow(context, "Email", CupertinoIcons.mail),
                  _buildDivider(),
                  _buildRow(context, "Password", CupertinoIcons.eye),
                  _buildDivider(),

                  const SizedBox(height: 40),
                  _buildEditProfileButton(),
                  const SizedBox(height: 0),
                  _loginButton(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildTopGradiantDesign() {
    return Container(
      height: 250,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.greenAccent, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(200, 120),
          bottomRight: Radius.elliptical(200, 120),
        ),
      ),
    );
  }

  Container _buildProfileImage() {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(60),
        image: const DecorationImage(
          image: NetworkImage(
            "https://static.wikia.nocookie.net/heroes-and-villain/images/2/28/Profile_-_Po.png/revision/latest?cb=20230223201331",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  TextButton _loginButton() {
    return TextButton(
      onPressed: () {
        Get.toNamed('/emailValidationScreen');
      },
      child: const Text(
        "Login Account?",
        style: TextStyle(decoration: TextDecoration.underline),
      ),
    );
  }

  ElevatedButton _buildEditProfileButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPallet.mainColorTheme,
        fixedSize: Size.fromWidth(Get.width * .9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
    );
  }

  Builder _buildAppDrawerFuntionality() {
    return Builder(
      builder: (context) {
        return Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              const SizedBox(height: 20),
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu, size: 30, color: Colors.indigo),
              ),
            ],
          ),
        );
      },
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: const DrawerHeader(child: Icon(CupertinoIcons.home)),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(height: 40, color: Colors.deepPurple.shade100);
  }

  Row _buildRow(BuildContext context, String info, IconData myIcon) {
    return Row(
      children: [
        const SizedBox(width: 20),
        Icon(myIcon, size: 30, color: ColorPallet.mainColorTheme),
        const SizedBox(width: 50),
        Text(info, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
