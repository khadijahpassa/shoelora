import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoelora/consts.dart';
import 'package:shoelora/state-management/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      // ternary operator: kondisi, action if true, action else
      // sebelum pake '?' error miss-match karena sebelumnya kita belum tau kalo ini adalah sebuah kondisi
      body: cartProvider.items.isEmpty 
      ? const Center(child: Text('Your cart is empty'))
      : ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) {
          final cartItem = cartProvider.items.values.toList()[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10
            ),
            // ListTile untuk menampilkan list
            child: ListTile(
              // leading
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem.image),
              ),
              title: Text(cartItem.title),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: (){
                  cartProvider.removeItems(cartItem.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${cartItem.title} has been removed from the cart."),
                    duration: const Duration(seconds: 2),
                  ),
                );
                }, 
              ),
            ),
          );
        } ,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "${cartProvider.totalPrice}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor
              ),
            )
          ]
        ),
      ),
    );
  }
}