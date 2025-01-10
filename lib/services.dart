class AsyncServices {
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3)); // Simula un retraso de 3 segundos
    return "Datos cargados exitosamente.";
  }

  Future<List<String>> fetchItems() async {
    await Future.delayed(Duration(seconds: 3)); // Simula un retraso de 3 segundos
    return ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  }

  Stream<int> counterStream() async* {
    int count = 0;
    while (true) {
      await Future.delayed(Duration(seconds: 1)); // Espera 1 segundo
      yield count++;
    }
  }

  Stream<double> simulateDownload() async* {
    double progress = 0.0;
    while (progress < 1.0) {
      await Future.delayed(Duration(milliseconds: 500)); // Simula un retraso
      progress += 0.1;
      yield progress;
    }
  }
}
