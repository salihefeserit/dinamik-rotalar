import 'package:flutter/material.dart';
import 'package:urunkatalog/product-detail.dart';
import 'package:urunkatalog/ProductModel.dart';

void main() {
  runApp(const urunApp());
}

final List<Product> _Products = [
  Product(id: 1, ad: "Tablet", ucret: 10000),
  Product(id: 2, ad: "Telefon", ucret: 20000),
  Product(id: 3, ad: "Laptop", ucret: 40000),
  Product(id: 4, ad: "Şarj Aleti", ucret: 400),
  Product(id: 5, ad: "Kılıf", ucret: 200),
];

class urunApp extends StatelessWidget {
  const urunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const _HomePage(),
        '/non-existent-route': (context) => const NotFoundPage()
      },
      onGenerateRoute: (settings) {
        final args = settings.arguments;

        if (settings.name == '/product') {
          if (args is Map<String, dynamic>) {
            final product = Product(
              id: args['id'] ?? 0,
              ad: args['ad'] ?? 'Bilinmiyor',
              ucret: args['ucret'] ?? 0.0,
            );
            return MaterialPageRoute(
              builder: (_) => ProductDetail(urun: product),
            );
          }
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => NotFoundPage(),
        );
      }
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Ürünler",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) =>
            ListTile(
              title: Text(_Products[index].ad),
              onTap: () =>
                  _navigateAndDisplaySnackBar(context, _Products[index]),
            ),
        separatorBuilder: (context, index) => const Divider(thickness: 3),
        itemCount: _Products.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/non-existent-route');
        },
        tooltip: 'Test 404',
        child: const Icon(Icons.error_outline),
      ),
    );
  }
}

void _navigateAndDisplaySnackBar(BuildContext context, Product product) async {
  final result = await Navigator.pushNamed(
    context,
    '/product',
    arguments: {
      'id': product.id,
      'ad': product.ad,
      'ucret': product.ucret,
    },
  );

  // Eğer bir sonuç döndüyse (null değilse), SnackBar göster
  if (result != null && context.mounted) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result'), behavior: SnackBarBehavior.floating,));
  }
}


class NotFoundPage extends StatelessWidget {
  final String message;

  const NotFoundPage({
    super.key,
    this.message = 'Aradığınız sayfa bulunamadı.',
  });

  @override
  Widget build(BuildContext context) {
    debugPrint(message);
    return Scaffold(
      appBar: AppBar(title: const Text('404 - Hata'), backgroundColor: Colors.lightGreen,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 60),
            const SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Geri Dön'),
            ),
          ],
        ),
      ),
    );
  }
}
