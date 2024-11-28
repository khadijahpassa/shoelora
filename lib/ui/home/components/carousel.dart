import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoelora/consts.dart';

// Komponen ImageCarousel
class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {

  // Daftar gambar untuk carousel
  final List<String> images = [
    'assets/images/slider_1.png',
    'assets/images/slider_2.png',
    'assets/images/slider_3.png',
  ];

  // Controller untuk PageView
  late PageController _pageController;
  
  // Menyimpan index gambar yang sedang ditampilkan
  int _currentIndex = 0;

  // Timer untuk auto-scroll setiap 3 detik
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Timer untuk auto slide setiap 3 detik
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;  // Reset ke gambar pertama
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Hentikan timer saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding),
      height: 160,
      child: Column(
        children: [
          // Carousel dengan PageView
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container( // Jarak antar gambar
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), // Radius sudut
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

}

