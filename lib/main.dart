import 'package:flutter/material.dart';
import 'package:urunkatalog/product_detail.dart';
import 'package:urunkatalog/not_found_page.dart';
import 'package:urunkatalog/homepage.dart';

void main() {
  runApp(const UrunApp());
}

class UrunApp extends StatelessWidget {
  const UrunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/notfoundpage': (context) => const NotFoundPage(),
      },
      onGenerateRoute: (settings) {
        debugPrint(
          "Gidilen Yol : ${settings.name}/${settings.arguments.toString()}",
        );
        final args = settings.arguments;
        if (settings.name == '/product') {
          if (args is int) {
            return MaterialPageRoute(
              builder: (_) => ProductDetail(prodid: args),
            );
          }
        }
        return MaterialPageRoute(builder: (context) => NotFoundPage());
      },
      onUnknownRoute: (RouteSettings settings) {
        debugPrint(
          "Bilinmeyen Yol : ${settings.name}/${settings.arguments.toString()}",
        );
        return MaterialPageRoute(builder: (context) => NotFoundPage());
      },
    );
  }
}

