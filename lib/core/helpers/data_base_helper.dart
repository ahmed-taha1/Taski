import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static Database? _instance;

  static Future<Database> _getInstance() async {
    _instance ??= await _initDB();
    return _instance!;
  }

  static _initDB() async {
    String dBPath = await getDatabasesPath();
    String path = join(dBPath, 'Taski.db');
    Database myDB = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpdate);
    return myDB;
  }

  static _onUpdate(Database db, int oldVersion, int newVersion) async {}

  static _onCreate(Database db, int version) async {
    try {
      await db.execute('''
      CREATE TABLE "Task"(
        "id" INTEGER PRIMARY KEY NOT NULL,
        "title" TEXT,
        "description" TEXT,
        "isCompleted" INTEGER
      )''');
    } catch (e) {
      rethrow;
    }
  }

  static query(String query) async {
    Database myDB = await _getInstance();
    List<Map> response = await myDB.rawQuery(query);
    return response;
  }

  static Future<int> insert(String query) async {
    Database myDB = await _getInstance();
    try {
      var response = await myDB.rawInsert(query);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<int> update(String query) async {
    Database myDB = await _getInstance();
    try {
      var response = await myDB.rawUpdate(query);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static delete(String query) async {
    Database myDB = await _getInstance();
    try {
      var response = await myDB.rawDelete(query);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
