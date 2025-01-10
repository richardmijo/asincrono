import 'package:asincrono/base_datos/database_helper.dart';
import 'package:flutter/material.dart';


class SQLiteCrudScreen extends StatefulWidget {
  @override
  _SQLiteCrudScreenState createState() => _SQLiteCrudScreenState();
}

class _SQLiteCrudScreenState extends State<SQLiteCrudScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  // Obtener todos los registros
  Future<void> _fetchPosts() async {
    final posts = await _dbHelper.getPosts();
    setState(() {
      _posts = posts;
    });
  }

  // Insertar un nuevo registro
  Future<void> _addPost(String title, String body) async {
    await _dbHelper.insertPost({'title': title, 'body': body});
    _fetchPosts();
  }

  // Actualizar un registro existente
  Future<void> _updatePost(int id, String title, String body) async {
    await _dbHelper.updatePost(id, {'title': title, 'body': body});
    _fetchPosts();
  }

  // Eliminar un registro
  Future<void> _deletePost(int id) async {
    await _dbHelper.deletePost(id);
    _fetchPosts();
  }

  // Mostrar el formulario para agregar/actualizar registros
  void _showPostForm({int? id, String? initialTitle, String? initialBody}) {
    final titleController = TextEditingController(text: initialTitle ?? '');
    final bodyController = TextEditingController(text: initialBody ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(id == null ? 'Nuevo Registro' : 'Actualizar Registro'),
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
              child: Text(id == null ? 'Agregar' : 'Actualizar'),
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
        title: Text('CRUD con SQLite'),
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
