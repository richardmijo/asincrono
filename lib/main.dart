import 'package:asincrono/api_simulation.dart';
import 'package:asincrono/download_example.dart';
import 'package:asincrono/future_example.dart';
import 'package:asincrono/stream_example.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplos de Asíncrona',
      theme: ThemeData(
        primaryColor: Color(0xFF7A003C), // Granate UIDE
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF7A003C),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF7A003C), // Granate
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/futureExample': (context) => FutureExample(),
        '/streamExample': (context) => StreamExample(),
        '/apiSimulation': (context) => ApiSimulationExample(),
        '/downloadExample': (context) => DownloadExample(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplos de Asíncrona'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFD700), Colors.white], // Amarillo a blanco
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Explora ejemplos de programación asíncrona',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7A003C), // Granate
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                MenuButton(
                  title: 'Ejemplo Future',
                  icon: Icons.timer,
                  onTap: () => Navigator.pushNamed(context, '/futureExample'),
                ),
                MenuButton(
                  title: 'Ejemplo Stream',
                  icon: Icons.stream,
                  onTap: () => Navigator.pushNamed(context, '/streamExample'),
                ),
                MenuButton(
                  title: 'Ejemplo API Simulada',
                  icon: Icons.cloud_download,
                  onTap: () => Navigator.pushNamed(context, '/apiSimulation'),
                ),
                MenuButton(
                  title: 'Ejemplo Descarga',
                  icon: Icons.download,
                  onTap: () => Navigator.pushNamed(context, '/downloadExample'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 20, color: Colors.white),
        label: Text(title),
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50), // Botón ancho
          textStyle: TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: Color(0xFF7A003C), // Granate
          shadowColor: Color(0xFFFFD700), // Sombra amarilla
        ),
      ),
    );
  }
}
