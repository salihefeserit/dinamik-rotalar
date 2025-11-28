import 'package:flutter/material.dart';
import 'package:urunkatalog/product_detail.dart';
import 'package:urunkatalog/product_model.dart';
import 'package:urunkatalog/not_found_page.dart';

void main() {
  runApp(const UrunApp());
}

class UrunApp extends StatelessWidget {
  const UrunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/non-existent-route': (context) => const NotFoundPage(),
      },
      onGenerateRoute: (settings) {
        final args = settings.arguments;

        if (settings.name == '/product') {
          if (args is Map<String, dynamic>) {
            final product = Product(
              id: args['id'] ?? 0,
              ad: args['ad'] ?? 'Unknown',
              ucret: args['ucret'] ?? 0.0,
            );
            return MaterialPageRoute(
              builder: (_) => ProductDetail(urun: product),
            );
          }
        }
        return MaterialPageRoute(builder: (context) => NotFoundPage());
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => NotFoundPage());
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Ürünler",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(products[index].ad),
          onTap: () => _navigateAndDisplaySnackBar(context, products[index]),
        ),
        separatorBuilder: (context, index) => const Divider(thickness: 3),
        itemCount: products.length,
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
    arguments: {'id': product.id, 'ad': product.ad, 'ucret': product.ucret},
  );

  if (result != null && context.mounted) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('$result'), behavior: SnackBarBehavior.floating),
      );
  }
}
