import 'package:shoelora/consts.dart';
import 'package:shoelora/models/products.dart';
import 'package:shoelora/ui/cart/cart_screen.dart';
import 'package:shoelora/ui/detail/components/add_to_cart.dart';
import 'package:shoelora/ui/detail/components/cart_counter.dart';
import 'package:shoelora/ui/detail/components/color_and_size.dart';
import 'package:shoelora/ui/detail/components/description.dart';
import 'package:shoelora/ui/detail/components/fav_button.dart';
import 'package:shoelora/ui/detail/components/product_title.dart';
import 'package:flutter/material.dart';
import 'package:shoelora/ui/wishlist/wishlist_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    // The way that use for making the widget become responsive, as the device size
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0, // remove shadow
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const WishlistScreen())
              );
            }, 
            icon: const Icon(Icons.favorite_border_outlined)

          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const CartScreen())
              );
            }, 
            icon: const Icon(Icons.shopping_cart_outlined)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  // Container putih
                  Container(
                    // set ukuran objek agar responsive, mengambil 30% dari tinggi layar (3/10)
                    // 70% untuk container putih
                    margin: EdgeInsets.only(top: size.height * 0.35),
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        ColorAndSize(product: product),
                        const SizedBox(height: defaultPadding),
                        Description(product: product),
                        const SizedBox(height: defaultPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CartCounter(),
                            FavButton(product: product)
                          ],
                        ),
                        const SizedBox(height: defaultPadding),
                        AddToCart(product: product)
                      ]
                    ),
                  ),
                  // Title widget placed above the image
                  // Positioned =  berguna untuk mengatur letak widget secara "spesifik" ketika menggunakan Stack()
                  Positioned(
                    top: size.height * 0.05,
                    left: defaultPadding,
                    right: defaultPadding,
                    child: ProductTitle(product: product)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}