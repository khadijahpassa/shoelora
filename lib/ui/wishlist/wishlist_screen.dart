import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoelora/state-management/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: wishlistProvider.wishlistItem.isEmpty
      ? const Center(child: Text("Your wishlist is empty"))
      : ListView.builder(
        itemCount: wishlistProvider.wishlistItem.length,
        itemBuilder: (context, index) {
          final wishlistItem = wishlistProvider.wishlistItem.values.toList()[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(wishlistItem.image),
              ),
              title: Text(wishlistItem.title),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  wishlistProvider.removeItemFromFav(wishlistItem.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${wishlistItem.title} has been removed from wishlist."),
                    duration: const Duration(seconds: 2),
                  ));
                }, 
                
              ),
            ),
          );
        },
      )
    );
  }
}