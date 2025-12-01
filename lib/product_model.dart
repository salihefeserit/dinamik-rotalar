import 'package:flutter/material.dart';

class Product {
  final int id;
  final String ad;
  final int ucret;
  final IconData icon;

  const Product({required this.id, required this.ad, required this.ucret, required this.icon});
}

final List<Product> products = [
  Product(id: 1, ad: "Tablet", ucret: 10000, icon: Icons.tablet),
  Product(id: 2, ad: "Telefon", ucret: 20000, icon: Icons.phone_android_sharp),
  Product(id: 3, ad: "Laptop", ucret: 40000, icon: Icons.laptop),
  Product(id: 4, ad: "Şarj Aleti", ucret: 400, icon: Icons.charging_station_rounded),
  Product(id: 5, ad: "Klavye", ucret: 500, icon: Icons.keyboard),
];
