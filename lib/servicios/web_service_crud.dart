import 'package:asincrono/servicios/web_service_api.dart';
import 'package:flutter/material.dart';


class WebServiceCrudScreen extends StatefulWidget {
  const WebServiceCrudScreen({super.key});

  @override
  _WebServiceCrudScreenState createState() => _WebServiceCrudScreenState();
}

class _WebServiceCrudScreenState extends State<WebServiceCrudScreen> {
  final WebServiceAPI _api = WebServiceAPI(); // Instancia del servicio
  List<dynamic> posts = []; // Lista de publicaciones

  @override
  void initState() {
    super.initState();
    fetchPosts(); // Carga las publicaciones al inicio
  }

  // Obtener publicaciones desde el servicio
  Future<void> fetchPosts() async {
    try {
      final data = await _api.fetchPosts();
      setState(() {
        posts = data;
      });
    } catch (e) {
      print(e);
      showError('Error al obtener publicaciones');
    }
  }

  // Crear una nueva publicación
  Future<void> createPost(String title, String body) async {
    try {
      await _api.createPost(title, body);
      showSuccess('Publicación creada');
      fetchPosts();
    } catch (e) {
      showError('Error al crear la publicación');
    }
  }

  // Actualizar una publicación existente
  Future<void> updatePost(int id, String title, String body) async {
    try {
      await _api.updatePost(id, title, body);
      showSuccess('Publicación actualizada');
      fetchPosts();
    } catch (e) {
      showError('Error al actualizar la publicación');
    }
  }

  // Eliminar una publicación
  Future<void> deletePost(int id) async {
    try {
      await _api.deletePost(id);
      showSuccess('Publicación eliminada');
      fetchPosts();
    } catch (e) {
      showError('Error al eliminar la publicación');
    }
  }

  // Mostrar mensaje de éxito
  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ));
  }

  // Mostrar mensaje de error
  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  // Mostrar formulario para crear/actualizar publicaciones
  void showPostForm({int? id, String? initialTitle, String? initialBody}) {
    final titleController = TextEditingController(text: initialTitle ?? '');
    final bodyController = TextEditingController(text: initialBody ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(id == null ? 'Nueva Publicación' : 'Actualizar Publicación'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: bodyController,
                decoration: InputDecoration(labelText: 'Cuerpo'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (id == null) {
                  createPost(titleController.text, bodyController.text);
                } else {
                  updatePost(id, titleController.text, bodyController.text);
                }
                Navigator.pop(context);
              },
              child: Text(id == null ? 'Crear' : 'Actualizar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Servicios Web'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post['title']),
            subtitle: Text(post['body']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => showPostForm(
                    id: post['id'],
                    initialTitle: post['title'],
                    initialBody: post['body'],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deletePost(post['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showPostForm(),
        backgroundColor: Color(0xFF7A003C),
        child: Icon(Icons.add), // Granate UIDE
      ),
    );
  }
}
