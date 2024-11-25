import 'package:provider/provider.dart';
import 'package:shoelora/consts.dart';
import 'package:shoelora/models/products.dart';
import 'package:flutter/material.dart';
import 'package:shoelora/state-management/cart_provider.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: defaultPadding),
            height: 50,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: product.color)
            ),
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart_rounded),
              onPressed: () {
                cartProvider.addItem(
                  product.id.toString(), //data type converter
                  product.title,
                  product.price,
                  product.image
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Successfully add ${product.title} to cart"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }, 
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: product.color,
                maximumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                )
              ),
              onPressed: (){
                cartProvider.addItem(
                  product.id.toString(), 
                  product.title, 
                  product.price,
                  product.image
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${product.title} is purchased"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }, 
              child: const Text(
                "BUY NOW",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
          ),
          )
        ],
      ),
    );
  }
}