import 'package:asincrono/base_datos/sqlite_crud.dart';
import 'package:asincrono/servicios/web_service_crud.dart';
import 'package:flutter/material.dart';
import 'package:asincrono/basico/api_simulation.dart';
import 'package:asincrono/basico/download_example.dart';
import 'package:asincrono/basico/future_example.dart';
import 'package:asincrono/basico/stream_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Este widget define el tema general de la aplicación y el widget raíz
    return MaterialApp(
      title: 'Ejemplos de Asíncrona',
      theme: ThemeData(
        primaryColor: Color(0xFF7A003C), // Color institucional granate
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF7A003C), // Fondo del AppBar
          foregroundColor: Colors.white, // Texto y botones del AppBar
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF7A003C), // Color para la pestaña seleccionada
          unselectedItemColor: Colors.grey, // Color para las pestañas no seleccionadas
        ),
      ),
      home: MainTabController(), // Define la pantalla inicial
    );
  }
}

// Controlador principal de Tabs (menú inferior)
class MainTabController extends StatefulWidget {
  const MainTabController({super.key});

  @override
  _MainTabControllerState createState() => _MainTabControllerState();
}

class _MainTabControllerState extends State<MainTabController> {
  int _currentIndex = 0; // Índice de la pestaña seleccionada

  // Lista de widgets que representan cada pestaña
  final List<Widget> _tabs = [
    AsynchronousExamplesScreen(), // Pestaña de ejemplos asíncronos
    WebServiceManagementScreen(), // Pestaña de gestión de servicios web
    SQLiteManagementScreen(),     // Pestaña de gestión de SQLite
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplos de Flutter'), // Título en el AppBar
        centerTitle: true,
      ),
      body: Container(
        // Fondo con gradiente (amarillo a blanco)
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFD700), Colors.white], // Amarillo a blanco
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _tabs[_currentIndex], // Muestra el contenido de la pestaña seleccionada
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Controla cuál pestaña está activa
        onTap: (index) {
          // Cambia la pestaña activa cuando se selecciona una diferente
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          // Define las opciones del menú inferior
          BottomNavigationBarItem(
            icon: Icon(Icons.timer), // Icono para la pestaña Asíncrono
            label: 'Asíncrono',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud), // Icono para Servicios Web
            label: 'Servicios Web',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage), // Icono para SQLite
            label: 'SQLite',
          ),
        ],
      ),
    );
  }
}

// Pantalla para los ejemplos de programación asíncrona
class AsynchronousExamplesScreen extends StatelessWidget {
  const AsynchronousExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            SizedBox(height: 20), // Espacio entre el texto y los botones
            MenuButton(
              title: 'Ejemplo Future', // Botón que muestra el ejemplo de Future
              icon: Icons.timer,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FutureExample()),
              ),
            ),
            MenuButton(
              title: 'Ejemplo Stream', // Botón que muestra el ejemplo de Stream
              icon: Icons.stream,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StreamExample()),
              ),
            ),
            MenuButton(
              title: 'Ejemplo API Simulada', // Botón para el ejemplo de API
              icon: Icons.cloud_download,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ApiSimulationExample()),
              ),
            ),
            MenuButton(
              title: 'Ejemplo Descarga', // Botón para el ejemplo de descarga
              icon: Icons.download,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DownloadExample()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla para la gestión de servicios web (contenido por implementar)
class WebServiceManagementScreen extends StatelessWidget {
  const WebServiceManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WebServiceCrudScreen(); // Carga la pantalla de CRUD
  }
}

// Pantalla para la gestión de SQLite (contenido por implementar)
class SQLiteManagementScreen extends StatelessWidget {
  const SQLiteManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SQLiteCrudScreen(); // Muestra la pantalla CRUD para SQLite
  }
}

// Botón reutilizable para el menú de opciones
class MenuButton extends StatelessWidget {
  final String title; // Título del botón
  final IconData icon; // Icono del botón
  final VoidCallback onTap; // Acción al presionar el botón

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
        icon: Icon(icon, size: 20, color: Colors.white), // Icono del botón
        label: Text(title), // Texto del botón
        onPressed: onTap, // Acción al presionar
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
