import 'package:flutter/material.dart';
import 'package:shoelora/consts.dart';
import 'package:shoelora/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, required this.text, required this.image,
  });
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "Shoelora",
          style: TextStyle(
            color: primaryColor,
            fontSize: getProportionateScreenWidth(36.0),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Image.asset(image)
      ],
    );
  }
}