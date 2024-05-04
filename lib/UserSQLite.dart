import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UtilsSQLite {
  static Future<Database?> connect(String filePath) async {
    Database? database; // Initialitzar com a null
    try {
      database = await openDatabase(
        join(await getDatabasesPath(), filePath),
        onCreate: (db, version) {
          // En cas que la Base de Dades no existeixi, es crea aquí.
          // En cas de necessitar-ho, es poden executar declaracions d'SQL per crear taules.
        },
        version: 1,
      );
    } catch (e) {
      if (kDebugMode) {
        print("Error opening database: $e");
      }
    }
    return database;
  }

  static Future<void> disconnect(Database database) async {
    await database.close();
    if (kDebugMode) {
      print("Database disconnected");
    }
  }

  static Future<List<String>> listTables(Database database) async {
    List<String> tables = [];
    try {
      List<Map<String, dynamic>> result = await database.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table'");
      for (Map<String, dynamic> row in result) {
        tables.add(row['name'] as String);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error listing tables: $e");
      }
    }
    return tables;
  }

  static Future<int> queryUpdate(Database database, String sql) async {
    int result = 0;
    try {
      result = await database.rawUpdate(sql);
    } catch (e) {
      if (kDebugMode) {
        print("Error updating database: $e");
      }
    }
    return result;
  }

  static Future<List<Map<String, dynamic>>> querySelect(
      Database database, String sql) async {
    List<Map<String, dynamic>> result = [];
    try {
      result = await database.rawQuery(sql);
    } catch (e) {
      if (kDebugMode) {
        print("Error selecting from database: $e");
      }
    }
    return result;
  }
}
