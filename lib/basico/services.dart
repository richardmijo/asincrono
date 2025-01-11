// Simula operaciones como obtener datos y manejar streams.
class AsyncServices {
  
  // Método que simula la obtención de datos después de un retraso.
  // Retorna un Future<String>, que es una promesa de devolver una cadena de texto en el futuro.
  Future<String> fetchData() async {
    // Simula un retraso de 3 segundos para imitar una operación como una solicitud HTTP.
    await Future.delayed(Duration(seconds: 3));
    // Una vez completado el retraso, retorna la cadena de texto.
    return "Datos cargados exitosamente.";
  }

  // Método que simula la obtención de una lista de elementos después de un retraso.
  // Retorna un Future<List<String>>, que es una promesa de devolver una lista de cadenas de texto en el futuro.
  Future<List<String>> fetchItems() async {
    // Simula un retraso de 3 segundos.
    await Future.delayed(Duration(seconds: 3));
    // Retorna una lista de elementos después del retraso.
    return ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  }

  // Método que retorna un Stream<int>, emitiendo números enteros secuenciales cada segundo.
  // Utiliza async* porque genera valores uno a uno de forma asincrónica.
  Stream<int> counterStream() async* {
    int count = 0; // Inicializa el contador.
    while (true) { // Un bucle infinito para emitir valores continuamente.
      await Future.delayed(Duration(seconds: 1)); // Espera 1 segundo entre emisiones.
      yield count++; // Emite el valor actual del contador y lo incrementa.
    }
  }

  // Método que simula la descarga de un archivo y retorna un Stream<double>.
  // El stream emite el progreso de la descarga en incrementos hasta alcanzar el 100% (1.0).
  Stream<double> simulateDownload() async* {
    double progress = 0.0; // Inicializa el progreso de la descarga.
    while (progress < 1.0) { // Continua emitiendo valores mientras el progreso sea menor a 1.0.
      await Future.delayed(Duration(milliseconds: 500)); // Espera 500 milisegundos entre emisiones.
      progress += 0.1; // Incrementa el progreso en 0.1 (10%).
      yield progress; // Emite el valor actual del progreso.
    }
  }
}
