import 'package:provider/provider.dart';
import 'package:shoelora/consts.dart';
import 'package:shoelora/models/products.dart';
import 'package:flutter/material.dart';
import 'package:shoelora/state-management/theme_provider.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Text(
        product.description,
        style: TextStyle(
          height: 1.5,
          color: themeProvider.isDarkTheme ?  const Color(0xFFC8C8C8) : const Color(0xFF0A080E)
        ),
      ),
    );
  }
}