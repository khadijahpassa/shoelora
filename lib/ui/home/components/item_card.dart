import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shoelora/consts.dart';
import 'package:shoelora/models/products.dart';
import 'package:shoelora/state-management/theme_provider.dart';
import 'package:shoelora/ui/detail/components/fav_button.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                // Gambar produk dengan dekorasi
                Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Hero(
                    tag: "${product.id}",
                    child: Image.asset(product.image),
                  ),
                ),
                // Tombol favorite di pojok kanan atas
                Positioned(
                  top: 5, // Jarak dari atas
                  right: 5, // Jarak dari kanan
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkTheme ? const Color(0xA00A080E) : Colors.white.withOpacity(0.6), // Warna putih transparan 60%
                      shape: BoxShape.circle, // Membuat bentuk bulat
                    ),
                    child: FavButton(product: product), // Tombol favorit
                  ),
                ),
              ],
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
