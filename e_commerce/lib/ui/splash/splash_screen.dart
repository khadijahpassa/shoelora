import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/ui/splash/components/body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We need to call this in our starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}