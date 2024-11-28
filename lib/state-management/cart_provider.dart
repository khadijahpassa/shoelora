import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String title;
  final int price;
  final String image;
  // ngga final karena ngga required
  int quantity;

  CartItem({
    required this.id, 
    required this.title, 
    required this.price, 
    required this.image,
    // defaut quantity
    this.quantity = 1}
  );
}

// to know what's the differences between OOP and FP(functional programming)
class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  Map<String, int> _quantities = {};
  // kalo ngga nambah2in, berarti default value nya 1
  int getQuantity(String productId) => _quantities[productId] ?? 1;

  /* berfungsi untuk handle perhitungan total harga
  yang ada di keranjang, bukan total dari quantity per id */
  int get totalPrice {
    return _items.values.fold(
      // initial status sebelum operasi matematika dilakukan. 
      // jika bukan zero, akan terjadi penumpukan operasi
      0, 
      // sum(0) untuk menambahkan item.price
      (sum, item) => sum + item.price * item.quantity
    );
  }

  void addItem(String id, String title, int price, String image, int quantity){
    // kalo produk sudah ada di dalam keranjang
    // menambahkan item ke keranjang dengan jumlah yang ditentukan oleh cart counter
    if (_items.containsKey(id)) {
      // kuantitasnya ditambah sesuai dengan yang ditambah di cart counter 
      // dengan kuantitas yang sudah ada di cart screen, 
      // quantity definisikan juga di parameter
      _items[id]!.quantity += quantity;
      // mengembalikan value CartItem
      // return;
    } else {
      _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity: 1);
      // initial state untuk try-catch
      // _items.putIfAbsent(
      //   id, 
      //   () => CartItem(id: id, title: title, price: price, image: image)
      // );
    }
    notifyListeners();
  }

  void removeItems(String id){
    if (_items.containsKey(id)) {
      // kurangi kuantitas item
      _items[id]!.quantity --;

      // jika kuantitas item sudah 0, maka remove item di keranjang
      if (_items[id]!.quantity <= 0) {
        _items.remove(id); //kalo mau langsung kehapus semua, cukup pake line ini tanpa if condition
      }
    }
    notifyListeners();
  }
}