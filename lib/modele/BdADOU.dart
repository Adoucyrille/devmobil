import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Redacteur.dart';

class DatabaseADOU {
  static final DatabaseADOU instance = DatabaseADOU._init();
  static Database? _database;

  DatabaseADOU._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('redacteurs.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE redacteurs(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL,
        prenom TEXT NOT NULL,
        email TEXT NOT NULL,
        domicile TEXT NOT NULL
      )
    ''');
  }

  // -------------------- CRUD METHODS --------------------

  // CREATE
  Future<int> insertRedacteur(Redacteur redacteur) async {
    final db = await instance.database;
    return await db.insert('redacteurs', redacteur.toMap());
  }

  // Lire
  Future<List<Redacteur>> getAllRedacteurs() async {
    final db = await instance.database;
    final result = await db.query('redacteurs', orderBy: 'id DESC');
    return result.map((json) => Redacteur.fromMap(json)).toList();
  }

  // Lire ONE
  Future<Redacteur?> getRedacteur(int id) async {
    final db = await instance.database;
    final result = await db.query('redacteurs', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Redacteur.fromMap(result.first);
    } else {
      return null;
    }
  }

  // UPDATE
  Future<int> updateRedacteur(Redacteur redacteur) async {
    final db = await instance.database;
    return await db.update(
      'redacteurs',
      redacteur.toMap(),
      where: 'id = ?',
      whereArgs: [redacteur.id],
    );
  }

  // DELETE
  Future<int> deleteRedacteur(int id) async {
    final db = await instance.database;
    return await db.delete('redacteurs', where: 'id = ?', whereArgs: [id]);
  }

  // CLOSE DATABASE
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
