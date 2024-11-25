import 'package:flutter/material.dart';
import 'package:shoelora/size_config.dart';
import 'package:shoelora/ui/splash/components/body.dart';

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