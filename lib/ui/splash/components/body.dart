import 'package:flutter/material.dart';
import 'package:shoelora/consts.dart';
import 'package:shoelora/ui/auth/login_screen.dart';
import 'package:shoelora/ui/splash/components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  // List<String> product = List.generate(
  //   10, (index) => "Product ${index +1}"
  //   );

  // dasar pengambilan data dari API
  List<Map<String, String>> splashData = [
    {
      "text": "Stylish shoes for men and women, shop now.",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "Discover trendy and classic \nfootwear for every occasion.",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Quick shopping, secure checkout, \nfast delivery to you.",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 3, //untuk memenuhi 3 ruang yang kosong
              child: SizedBox(
                width: double.infinity, //biar di tengah dengan titik koor 0.0
                child: PageView.builder( //nampung data slide, builder: membangun data
                    controller: _pageController, 
                    onPageChanged: (value) {
                      // initial state method for statefulWidget behavior. method yang meng-set state awal untuk perilaku statefulWidget, ketika kita mau mengawali statefulWidget dengan apa
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length, //memberikan batasan slide, length: definisi panjang array(data)
                    // sebagai adapter antara splashData & SplashContent 
                    itemBuilder: (context, index) => SplashContent( //context: memperkenalkan dlu kalo ini tuh punya body.dart, index: akses list data array
                        text: splashData[index]["text"]!, 
                        image: splashData[index]["image"]!)
                 ),
              )),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(splashData.length, //List.generate(untuk menghasilkan jumlah widget dots sesuai dengan panjang data splashData)
                    (index) => _dotsIndicator(index: index)  //mengakses index untuk menentukan posisi dot yang aktif
                  )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: (){
                  // Kode yang digunakan untuk berpindah antar halaman

                  // indeks dimulai dari 0, sementara length mengembalikan jumlah total elemen. 
                  // Karena ada 3 elemen di splashData, jadi length akan menghasilkan nilai 3. 
                  // Tapi, indeks dari halaman terakhir adalah 2 (karena indeks dimulai dari 0). 
                  // Jadi,  dikurangi 1 dari panjang data (splashData.length - 1) 
                  // untuk mendapatkan indeks elemen terakhir.
                  if (currentPage == splashData.length - 1) { //.length ambil semua panjang data -> 3
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  } else {
                    // kalo belum di hal terakhir, btn bakal gerakin ke halaman selanjutnya dgn animateToPage
                    _pageController.animateToPage(
                      currentPage + 1, 
                      duration: animationDuration, 
                      curve: Curves.ease
                    );
                  }
                },
                // kode yang mengubah teks btn ketika di page terakhir
                child: ButtonTheme(
                  buttonColor: primaryColor,
                  child: Text(
                    currentPage == splashData.length - 1 ? "Start" : "Next",
                    style: const TextStyle(
                      color: Colors.white,
                    ),  
                  )
                )
              ),
            ),
          ),
        ],
      ),
    ));
  }

  // Kode untuk logika dots indicator
  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // dots halaman yang aktif, warnanya jadi primary
        color: currentPage == index ? primaryColor : secondaryColor,
      ),
      width: currentPage == index ? 20 : 10,
      height: 10,
    );
  }
}
