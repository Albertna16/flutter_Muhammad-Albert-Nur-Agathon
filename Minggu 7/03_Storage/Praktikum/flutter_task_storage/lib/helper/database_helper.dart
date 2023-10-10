import 'package:flutter_task_storage/models/contact_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();
  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableName = "contact";
  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), "contact_db.db"),
      onCreate: (db, version) async {
        await db.execute(
          ''' CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, name TEXT, number TEXT) ''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> addContact(ContactModels contactModels) async {
    final Database db = await database;
    await db.insert(_tableName, contactModels.toMap());
  }

  Future<List<ContactModels>> getContact() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => ContactModels.fromMap(e)).toList();
  }

  Future<ContactModels> getContactId(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => ContactModels.fromMap(e)).first;
  }

  Future<void> updateContact(ContactModels contactModels) async {
    final Database db = await database;
    await db.update(
      _tableName,
      contactModels.toMap(),
      where: 'id = ?',
      whereArgs: [contactModels.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}