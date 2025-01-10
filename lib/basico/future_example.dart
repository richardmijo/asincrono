import 'package:asincrono/basico/services.dart';
import 'package:flutter/material.dart';

class FutureExample extends StatelessWidget {
  final AsyncServices _services = AsyncServices();

  FutureExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo Future')),
      body: Center(
        child: FutureBuilder<String>(
          future: _services.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text(snapshot.data ?? 'Sin datos');
            }
          },
        ),
      ),
    );
  }
}
