import 'package:asincrono/basico/services.dart';
import 'package:flutter/material.dart';

class DownloadExample extends StatelessWidget {
  final AsyncServices _services = AsyncServices();

  DownloadExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo Descarga')),
      body: Center(
        child: StreamBuilder<double>(
          stream: _services.simulateDownload(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Preparando descarga...', style: TextStyle(fontSize: 18));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              double progress = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinearProgressIndicator(value: progress),
                  SizedBox(height: 20),
                  Text('${(progress * 100).toStringAsFixed(0)}% completado', style: TextStyle(fontSize: 18)),
                ],
              );
            } else {
              return Text('Descarga completa', style: TextStyle(fontSize: 18, color: Colors.green));
            }
          },
        ),
      ),
    );
  }
}
