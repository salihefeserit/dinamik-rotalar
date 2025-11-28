import 'package:flutter/material.dart';

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
