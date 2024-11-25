import 'package:shoelora/models/products.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoelora/consts.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16)),
              child:
                  //Hero: makes the image animate when it's tapped
                  //tag: untuk menghubungkan gambar produk yang diklik sama animasi ke halaman tujuan
                  Hero(tag: "${product.id}", child: Image.asset(product.image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              product.title,
              style: const TextStyle(color: textColor),
            ),
          ),
          Text("Rp${NumberFormat('#,###').format(product.price)}")
        ],
      ),
    );
  }
}
