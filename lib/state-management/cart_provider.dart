import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String title;
  final int price;
  final String image;

  CartItem(this.image, {required this.id, required this.title, required this.price});
}

// to know what's the differences between OOP and FP(functional programming)
class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  /* berfungsi untuk handle perhitungan total harga
  yang ada di keranjang */
  int get totalPrice {
    return _items.values.fold(
      0, 
      // sum untuk menambahkan item.price
      (sum, item) => sum + item.price
    );
  }

  void addItem(String id, String title, int price, String image){
    if (_items.containsKey(id)) {
      // mengembalikan value CartItem
      return;
    } else {
      // initial state untuk try-catch
      _items.putIfAbsent(
        id, 
        () => CartItem(image, id: id, title: title, price: price)
      );
    }
    notifyListeners();
  }

  void removeItems(String id){
    _items.remove(id);
    notifyListeners();
  }

  void clearCart(){
    _items.clear();
    notifyListeners();
  }
}