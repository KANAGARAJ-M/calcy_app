// lib/database_helper.dart

import 'package:calcy_app/Models/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT,
        date TEXT
      )
    ''');
  }

  Future<int> insertNote(Note note) async {
    Database db = await database;
    return await db.insert('notes', note.toMap());
  }

  Future<int> updateNote(Note note) async {
    Database db = await database;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    Database db = await database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Note>> getNotes() async {
    Database db = await database;
    var notes = await db.query('notes', orderBy: 'date DESC');
    List<Note> noteList =
        notes.isNotEmpty ? notes.map((c) => Note.fromMap(c)).toList() : [];
    return noteList;
  }
}
