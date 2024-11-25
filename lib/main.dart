import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoelora/consts.dart';
import 'package:shoelora/state-management/wishlist_provider.dart';
import 'package:shoelora/ui/settings/settings_screen.dart';
import 'package:shoelora/state-management/cart_provider.dart';
import 'package:shoelora/state-management/theme_provider.dart';
import 'package:shoelora/ui/auth/login_screen.dart';
import 'package:shoelora/ui/auth/register_screen.dart';
import 'package:shoelora/ui/splash/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const Shoelora()
    )
  );
}

class Shoelora extends StatefulWidget {
  const Shoelora({super.key});

  @override
  State<Shoelora> createState() => _ShoeloraState();
}

class _ShoeloraState extends State<Shoelora> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) { 
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoelora',
        theme: ThemeData(
          brightness: themeProvider.isDarkTheme ? Brightness.dark :Brightness.light,
          scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
          fontFamily: 'Muli',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: textColor),
            bodySmall: TextStyle(color: textColor)
          )
        ),
        initialRoute: '/',
        routes: {
          // format pasangan key : value adalah => nama rute : kelas yang dituju
          '/' : (context) => const SplashScreen(),
          '/login' : (context) => LoginPage(),
          '/register' : (context) => RegisterPage(),
          '/settings' : (context) => const SettingsScreen(),
        },
      );
    }
      
    );
  }
}