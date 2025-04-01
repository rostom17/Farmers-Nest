import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Center(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: SvgPicture.asset(
            "assets/images/FarmersNestLogo.svg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
