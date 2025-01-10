import 'package:asincrono/basico/services.dart';
import 'package:flutter/material.dart';

class ApiSimulationExample extends StatelessWidget {
  final AsyncServices _services = AsyncServices();

  ApiSimulationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo API Simulada')),
      body: FutureBuilder<List<String>>(
        future: _services.fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final items = snapshot.data ?? [];
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}