import 'package:flutter/material.dart';
import 'package:urunkatalog/product_model.dart';

class ProductDetail extends StatelessWidget {
  final int prodid;

  const ProductDetail({super.key, required this.prodid});

  @override
  Widget build(BuildContext context) {
    final Product urun = products.firstWhere((urun) => urun.id == prodid);
    return Scaffold(
      appBar: AppBar(title: Text(urun.ad)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ID: ${urun.id}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Fiyat: ${urun.ucret} TL',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '"${urun.ad}" sepete eklendi!');
              },
              child: const Text('Sepete Ekle ve Geri Dön'),
            ),
          ],
        ),
      ),
    );
  }
}
