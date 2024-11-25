import 'package:flutter/material.dart';
import 'package:shoelora/consts.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Sneakers",
    "Heels",
    "Sandals",
    "Flats",
  ];
  // var set index, untuk selected index -> default 0
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          // biar arahnya kesamping
          scrollDirection: Axis.horizontal,
          itemCount: categories.length, 
          // untuk menampung/membangun data yang mana datanya akan ditampilkan di layar
          itemBuilder: (context, index) => _buildCategory(index)
        ),
      ),
    );
  }
  //
  GestureDetector _buildCategory(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index; // untuk nentuin kategori mana yang aktif
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ?  primaryColor : secondaryColor
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: defaultPadding / 7
                ),
                height: 2,
                width: 30,
                color: selectedIndex == index ?  primaryColor : secondaryColor
              )
            ],
          ),
        ),
      );
  }
}