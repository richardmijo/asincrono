import 'package:asincrono/basico/services.dart';
import 'package:flutter/material.dart';

// Clase principal que representa una pantalla con un ejemplo del uso de Future.
class FutureExample extends StatelessWidget {
  // Instancia de la clase AsyncServices que contiene la función `fetchData`.
  // Esta clase probablemente maneja la lógica de obtener datos de forma asíncrona.
  final AsyncServices _services = AsyncServices();

  // Constructor de la clase FutureExample.
  FutureExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz gráfica de la pantalla.
    return Scaffold(
      // AppBar es la barra superior de la pantalla.
      appBar: AppBar(
        title: Text('Ejemplo Future'), // Título que aparece en la AppBar.
      ),
      // El cuerpo de la pantalla está centrado y contiene un FutureBuilder.
      body: Center(
        // FutureBuilder es un widget que construye su contenido basado en un Future.
        child: FutureBuilder<String>(
          // Se pasa el Future devuelto por la función fetchData del servicio.
          future: _services.fetchData(),
          // El builder construye el widget dependiendo del estado del Future.
          builder: (context, snapshot) {
            // Si el Future aún está en proceso de completarse (estado esperando).
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Muestra un indicador circular de carga mientras se esperan los datos.
              return CircularProgressIndicator();
            } 
            // Si hubo un error al completar el Future.
            else if (snapshot.hasError) {
              // Muestra un mensaje de error con la descripción del mismo.
              return Text('Error: ${snapshot.error}');
            } 
            // Si el Future se completó exitosamente.
            else {
              // Muestra los datos devueltos por el Future o un mensaje si son nulos.
              return Text(snapshot.data ?? 'Sin datos');
            }
          },
        ),
      ),
    );
  }
}
