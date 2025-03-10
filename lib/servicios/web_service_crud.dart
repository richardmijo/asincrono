import 'package:asincrono/servicios/web_service_api.dart';
import 'package:flutter/material.dart';


class WebServiceCrudScreen extends StatefulWidget {
  @override
  _WebServiceCrudScreenState createState() => _WebServiceCrudScreenState();
}

class _WebServiceCrudScreenState extends State<WebServiceCrudScreen> {
  final WebServiceAPI _api = WebServiceAPI(); // Instancia del servicio
  List<Map<String, dynamic>> _posts = []; // Lista de publicaciones locales

  @override
  void initState() {
    super.initState();
    _fetchPosts(); // Cargar las publicaciones al inicio
  }

  // Método para obtener todas las publicaciones desde el API
  Future<void> _fetchPosts() async {
    final posts = await _api.fetchPosts();
    setState(() {
      _posts = posts.map((post) => Map<String, dynamic>.from(post)).toList();
    });
  }

  // Método para crear una nueva publicación
  Future<void> _addPost(String title, String body) async {
    final newPost = await _api.createPost(title, body);
    setState(() {
      _posts.add(newPost); // Agregar la publicación a la lista local
    });
  }

  // Método para actualizar una publicación existente
  Future<void> _updatePost(int id, String title, String body) async {
    final updatedPost = await _api.updatePost(id, title, body);
    setState(() {
      final index = _posts.indexWhere((post) => post['id'] == id);
      if (index != -1) {
        _posts[index] = updatedPost; // Actualizar en la lista local
      }
    });
  }

  // Método para eliminar una publicación
  Future<void> _deletePost(int id) async {
    await _api.deletePost(id);
    setState(() {
      _posts.removeWhere((post) => post['id'] == id); // Eliminar de la lista local
    });
  }

  // Mostrar el formulario para agregar/actualizar publicaciones
  void _showPostForm({int? id, String? initialTitle, String? initialBody}) {
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
                  _addPost(titleController.text, bodyController.text);
                } else {
                  _updatePost(id, titleController.text, bodyController.text);
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
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return ListTile(
            title: Text(post['title']),
            subtitle: Text(post['body']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _showPostForm(
                    id: post['id'],
                    initialTitle: post['title'],
                    initialBody: post['body'],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deletePost(post['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPostForm(),
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF7A003C), // Granate UIDE
      ),
    );
  }
}
