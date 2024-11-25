import 'package:shoelora/consts.dart';
import 'package:shoelora/models/products.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});
  // manggil tapi izin dulu
  final Product product;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color"),
              Row(
                children: [
                  ColorPicker(
                    color: Color(0xFF4667FF), 
                    isSelected: true,
                  ),
                  ColorPicker(
                    color: Color(0xFFF8C078), 
                    isSelected: false,
                  ),
                  ColorPicker(
                    color: Color(0xFF989493), 
                    isSelected: false,
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          // Other way to showing and modifying the text
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Size:",
                style: TextStyle(color: textColor),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: textColor),
                  children: [
                    TextSpan(
                      text: "${product.size} CM",
                      style: Theme.of(context)
                      // yang . . itu method| .textTheme: ngebuat warna teks jadi kontras sama warna kanvas
                      .textTheme
                      .titleLarge! //tanpa harus kasih fontSize
                      .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ]
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  // tambahin variable untuk inline logic color picker
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: defaultPadding,
        right: 10
      ),
      padding: const EdgeInsets.all(2.5),
      width: 25,
      height: 25,
      // modifikasi untuk "border" dari ColorPicker nya
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent
        ),
      ),
      // DecoratedBox class untuk decor, sebuah class yang di dalamnya bisa masukin widget widget lagi(?), di mix sama BoxDecoration biar lebih variatif.
      child: DecoratedBox(
        // modifikasi untuk ColorPicker nya
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        )
      ),
    );
  }
}