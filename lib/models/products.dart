import 'package:flutter/material.dart';

// satu satunya acuan untuk data yang digunakan
class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  // untuk mendefinisikan variable yang sudah dibuat
  Product({
    // this adalah untuk menandaka bahwa semua objek terkait hanya bisa diakses oleh class
    // atau class yang sebelumnya memanggil class Product
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> product = [
  Product(
      id: 1,
      title: "Dallas",
      price: 56000,
      size: 34,
      description: descriptionText,
      image: "assets/images/sneakers_1.png",
      color: const Color(0xFFF46D3D)),
  Product(
      id: 2,
      title: "Aullie",
      price: 80000,
      size: 36,
      description: descriptionText,
      image: "assets/images/sneakers_2.png",
      color: const Color(0xFF62C3FF)),
  Product(
      id: 3,
      title: "Samba og w shoes",
      price: 75000,
      size: 40,
      description: descriptionText,
      image: "assets/images/sneakers_3.png",
      color: const Color(0xFFFFA546)),
  Product(
      id: 4,
      title: "574 Classic Lifestyle",
      price: 68000,
      size: 36,
      description: descriptionText,
      image: "assets/images/sneakers_4.png",
      color: const Color(0xFF4667FF)),
  Product(
      id: 5,
      title: "Devyn Enola",
      price: 100000,
      size: 40,
      description: descriptionText,
      image: "assets/images/sneakers_5.png",
      color: const Color(0xFF7E8EAA)),
  Product(
    id: 6,
    title: "Vanny",
    price: 245000,
    size: 38,
    description: descriptionText,
    image: "assets/images/sneakers_6.png",
    color: const Color(0xFF8B83FF),
  ),
];

String descriptionText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";