import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0, // remove shadow
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.search)

          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.shopping_cart_outlined)
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              'Women',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ),
          const Categories(), //untuk manggil Categories
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder( //nampilin list yang berbentuk column & row/list
                // ngatur tata letak grid
                //SliverGridDelegateWithFixedCrossAxisCount = ngebungkus widget biasa biar bisa ditempatin di dalam scroll view(lebih banyak opsi dari pada slever)
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75 //perbandingan tinggi dan lebar tiap item
                ), 
                // manpilin sesuai dengan data yang ada di data di model product.dart
                itemCount: product.length,
                // jembatan/adapter antara ItemCard(data) dan catalogue_screen(yang butuh)
                itemBuilder: (context, index) => ItemCard(
                  product: product[index], 
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      // panggil berdasarkan index yang diklik
                      builder: (context) => DetailScreen(product: product[index]),
                    ),
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}