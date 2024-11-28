import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoelora/consts.dart';
import 'package:shoelora/models/products.dart';
import 'package:shoelora/state-management/cart_provider.dart';
import 'package:shoelora/state-management/theme_provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;

  const CartCounter({super.key, required this.product});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  // set default jumlah item menjadi 1
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Row(
      children: <Widget>[
        // logika tombol decreament
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            iconColor: themeProvider.isDarkTheme ? const Color(0xFFC8C8C8) : const Color(0xFF0A080E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: quantity > 1
          ? () {
            setState(() {
              // mengurangi quantity secara lokal, belum termasuk di cart screen, 
              // kecuali setelah triggering tombol cart
              quantity--;
            });
            // mengurangi dan mengirim kuantitas terbaru
            cartProvider.removeItems(widget.product.id.toString());
          }
          // akan mendisable tombol jika kuantitas <= 1
          : null,

          child: const Icon(Icons.remove_rounded)
        ),
        // tampilan kuantitas
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            quantity.toString().padLeft(2, "0"),
            style: TextStyle(
              fontSize: 18,
              color: themeProvider.isDarkTheme ? const Color(0xFFC8C8C8) : const Color(0xFF0A080E)
            ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            iconColor: themeProvider.isDarkTheme ? const Color(0xFFC8C8C8) : const Color(0xFF0A080E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: () {
            // untuk menambahkan kuantitas secara lokal dan tidak akan masuk ke keranjang kecuali user memvalidasi dengan cart button
            setState(() {
              quantity++;
              // cartProvider.updateQuantity(widget.product.id.toString(), quantity);
            });

            /* 
            - pendeklarasian informasi yang akan dikirimkan ke addToCart (tombol keranjang) 
            - starting point dimana kuantitas akan dibawa oleh tombol keranjang ke halaman keranjang
            */
            cartProvider.addItem(
              widget.product.id.toString(),
              widget.product.title,
              widget.product.price,
              widget.product.image,
              1
            );
            // mengirim kuantitas terbaru
            // widget.onQuantityChanged(quantity);
          }, 
          child: const Icon(Icons.add_rounded)
        )
      ],
    );
  }
}