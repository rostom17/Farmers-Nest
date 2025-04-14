import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("Cateogry").get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Center(child: Text("No Data"));
            }
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (contex, index) {
                return InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 3,
                    color: chooseColor(index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: SizedBox(
                            height: 120,
                            //width: double.maxFinite,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                "${snapshot.data!.docs[index].data()["image"]}",
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        Center(child: Icon(Icons.broken_image)),
                              ),
                            ),
                          ),
                        ),
                        Text("${snapshot.data!.docs[index].data()["name"]}"),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Color chooseColor(int index) {
    if (index % 5 == 0) {
      return Colors.amber.shade200;
    } else if (index % 5 == 1) {
      return Colors.pink.shade200;
    } else if (index % 5 == 2) {
      return Colors.orange.shade200;
    } else if (index % 5 == 3) {
      return Colors.red.shade200;
    } else {
      return Colors.redAccent.shade200;
    }
  }
}
