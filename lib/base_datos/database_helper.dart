import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  // Inicializar la base de datos
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Crear la base de datos
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'example.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Crear la tabla inicial
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE posts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        body TEXT NOT NULL
      )
    ''');
  }

  // Insertar un nuevo registro
  Future<int> insertPost(Map<String, dynamic> post) async {
    final db = await database;
    return await db.insert('posts', post);
  }

  // Obtener todos los registros
  Future<List<Map<String, dynamic>>> getPosts() async {
    final db = await database;
    return await db.query('posts');
  }

  // Actualizar un registro
  Future<int> updatePost(int id, Map<String, dynamic> post) async {
    final db = await database;
    return await db.update(
      'posts',
      post,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Eliminar un registro
  Future<int> deletePost(int id) async {
    final db = await database;
    return await db.delete(
      'posts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
