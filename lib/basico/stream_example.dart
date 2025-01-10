import 'package:asincrono/basico/services.dart';
import 'package:flutter/material.dart';

class StreamExample extends StatelessWidget {
  final AsyncServices _services = AsyncServices();

  StreamExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo Stream')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _services.counterStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Contador: ${snapshot.data}', style: TextStyle(fontSize: 24));
            }
          },
        ),
      ),
    );
  }
}