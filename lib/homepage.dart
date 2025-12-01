import 'package:flutter/material.dart';
import 'package:urunkatalog/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Ürünler",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(products[index].icon),
          title: Text(products[index].ad),
          onTap: () => _navigateAndDisplaySnackBar(context, products[index]),
        ),
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemCount: products.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/notfoundpage');
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
    arguments: product.id,
  );

  if (result != null && context.mounted) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('$result'), behavior: SnackBarBehavior.floating),
      );
  }
}
