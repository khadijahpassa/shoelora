import 'package:provider/provider.dart';
import 'package:shoelora/consts.dart';
import 'package:shoelora/models/products.dart';
import 'package:flutter/material.dart';
import 'package:shoelora/state-management/theme_provider.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});
  // manggil tapi izin dulu
  final Product product;
  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Color",
                style: TextStyle(color: themeProvider.isDarkTheme ? const Color(0xFFC8C8C8) : const Color(0xFF0A080E))),
              const Row(
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
              Text(
                "Size:",
                style: TextStyle(color: themeProvider.isDarkTheme ?  const Color(0xFFC8C8C8) : const Color(0xFF0A080E)),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: themeProvider.isDarkTheme ?  const Color(0xFFC8C8C8) : const Color(0xFF0A080E)),
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