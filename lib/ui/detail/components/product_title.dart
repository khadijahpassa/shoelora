import 'package:shoelora/consts.dart';
import 'package:shoelora/models/products.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Definisikan ukuran proposional gambar sebagai variable const
    const double imageWidthRatio = 0.5; //50% dari lebar layar
    const double imageHeightRatio = 0.3; //30% dari tinggi layar

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the start
        children: [
          const Text(
            "Sneaker Peakers", // Static title
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title, // Dynamic product title
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Rp${NumberFormat('#,###').format(product.price)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                  width: size.width * imageWidthRatio, // Gunakan ratio untuk lebar gambar
                  height: size.height * imageHeightRatio, // Gunakan ratio untuk tinggi gambar
                  fit: BoxFit.contain, // Ensure proper scaling
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}