import 'dart:convert';
import 'package:http/http.dart' as http;

class WebServiceAPI {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  // Obtener todas las publicaciones
  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener publicaciones');
    }
  }

  // Crear una nueva publicación
  Future<void> createPost(String title, String body) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': title,
        'body': body,
        'userId': 1, // ID de usuario simulado
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Error al crear la publicación');
    }
  }

  // Actualizar una publicación existente
  Future<void> updatePost(int id, String title, String body) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': title,
        'body': body,
        'userId': 1, // ID de usuario simulado
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Error al actualizar la publicación');
    }
  }

  // Eliminar una publicación
  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Error al eliminar la publicación');
    }
  }
}
