import 'package:provider/provider.dart';
import 'package:shoelora/consts.dart';
import 'package:shoelora/models/products.dart';
import 'package:shoelora/state-management/theme_provider.dart';
import 'package:shoelora/ui/home/components/carousel.dart';
import 'package:shoelora/ui/home/components/search_bar.dart';
import 'package:shoelora/ui/settings/settings_screen.dart';
import 'package:shoelora/ui/cart/cart_screen.dart';
import 'package:shoelora/ui/detail/detail_screen.dart';
import 'package:shoelora/ui/home/components/bottom_nav_bar.dart';
import 'package:shoelora/ui/home/components/categories.dart';
import 'package:shoelora/ui/home/components/item_card.dart';
import 'package:shoelora/ui/profile/profile_screen.dart';
import 'package:shoelora/ui/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;

  // Widget options yang termasuk SettingsScreen
  final List<Widget> _widgetOptions = <Widget>[
    const CatalogueScreen(),
    const WishlistScreen(),
    const SettingsScreen(),
    const ProfileScreen()
  ];

  // function untuk aksi tap pada bottom nav bar
  void _onItemTapped(int index){ 
    setState(() {
      /* menyatakan bahwa initial actionnya
      akan menampilkan objek yang berada pada index ke-0 */
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeProvider.isDarkTheme ? const Color(0xFF0A080E) : Colors.white,
        elevation: 0, // remove shadow
        title: const Text(
          'Shoelora',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const WishlistScreen())
              );
            }, 
            icon: const Icon(Icons.favorite_outline_rounded)

          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const CartScreen())
              );
            }, 
            icon: const Icon(Icons.shopping_cart_outlined)
          ),
        ],
      ),
      body: _selectedIndex == 0 
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ImageCarousel(),
          const SearchField(),
          const Categories(), //untuk manggil Categories
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder( //nampilin list yang berbentuk column & row/list
                // ngatur tata letak grid
                //SliverGridDelegateWithFixedCrossAxisCount = ngebungkus widget biasa biar bisa ditempatin di dalam scroll view(lebih banyak opsi dari pada slever)
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75 //perbandingan tinggi dan lebar tiap item
                ), 
                // manpilin sesuai dengan data yang ada di data di model product.dart
                itemCount: product.length,
                // jembatan/adapter antara ItemCard(data) dan catalogue_screen(yang butuh)
                itemBuilder: (context, index) => ItemCard(
                  product: product[index], 
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      // panggil berdasarkan index yang diklik
                      builder: (context) => DetailScreen(product: product[index]),
                    ),
                  )
                ),
              ),
            ),
          )
        ],
      ): 
      _widgetOptions[_selectedIndex], //: representasi ternary operator
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}