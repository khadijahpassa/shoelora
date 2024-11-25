import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoelora/models/products.dart';
import 'package:shoelora/state-management/wishlist_provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    // ignore: collection_methods_unrelated_type
    // memeriksa apakah product ada di wishlist
    final isFavorite = wishlistProvider.wishlistItem.containsKey(
      product.id.toString()
    );

    return IconButton(
      onPressed: () {
        if (isFavorite) {
          // untuk menghapus item wishlist
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
        color: isFavorite ? Colors.pink.shade400 : Colors.grey.shade800,
      )
    );
  }
}