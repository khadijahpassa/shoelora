import 'package:shoelora/consts.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      // best practice, mendefinisikan column/row/flex dengan generic<>. karena ngasih tau ke induknya kalo isinya bakalan Widget
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(40, 40),
            iconColor: textColor,
            // paddingnya 0
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: () { 
            setState(() {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems--;
                });
              }
            });
          }, 
          child: const Icon(Icons.remove)
        ),
        const SizedBox(width: defaultPadding /4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding/2),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: const TextStyle(
              fontSize: 18,
              color: textColor
            ),
          ),
        ),
        
        const SizedBox(width: defaultPadding /4),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              minimumSize: const Size(40, 40),
              iconColor: textColor,
              // paddingnya 0
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: () { 
            setState(() {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems++;
                });
              }
            });
          }, 
          child: const Icon(Icons.add)
        ),
      ],
    );
  }
}