import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoelora/models/products.dart';
import 'package:shoelora/state-management/theme_provider.dart';
import 'package:shoelora/state-management/wishlist_provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  // bentuk dari inisialisasi variable
  final Product product;

  // bentuk dari deklarasi variable
  // final int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final themeProvider = Provider.of<ThemeProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    // memeriksa apakah product ada di wishlist
    final isFavorite = wishlistProvider.wishlistItem.containsKey(
      product.id.toString()
    );

    return IconButton(
      onPressed: () {
        if (isFavorite) {
          // untuk menghapus item wishlist via tombol favorite
          wishlistProvider.removeItemFromFav(product.id.toString());
        } else {
          wishlistProvider.addItemToFav(
            product.id.toString(),
            product.title, 
            product.price,
            product.image,
          );
        }
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.pink.shade400 : themeProvider.isDarkTheme ? const Color(0xFFC8C8C8) : Colors.grey.shade800,
      )
    );
  }
}