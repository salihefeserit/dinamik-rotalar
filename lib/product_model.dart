class Product {
  final int id;
  final String ad;
  final int ucret;

  const Product({required this.id, required this.ad, required this.ucret});
}

final List<Product> products = [
  Product(id: 1, ad: "Tablet", ucret: 10000),
  Product(id: 2, ad: "Telefon", ucret: 20000),
  Product(id: 3, ad: "Laptop", ucret: 40000),
  Product(id: 4, ad: "Şarj Aleti", ucret: 400),
  Product(id: 5, ad: "Kılıf", ucret: 200),
];