import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppData with ChangeNotifier {
  List<String> characterImages = [];
  List<String> characterNames = [];

  Future<void> addImagesById(int id) async {
    characterImages.clear();
    characterNames.clear();

    String dbPath = join(await getDatabasesPath(), 'doom.db');
    
    Database database = await openDatabase(
      dbPath,
      version: 1,
    );

    await database.transaction((txn) async {
      List<Map<String, dynamic>> result = await txn.rawQuery(
        'SELECT content, name '
        'FROM images '
        'WHERE id_character = $id'
      );
      for (Map<String, dynamic> row in result) {
        if (!characterImages.contains('./assets/characters/${row['content']}') &&!characterNames.contains(row['name'])) {
          characterImages.add('./assets/characters/${row['content']}');
          characterNames.add(row['name']);
        }
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Error opening database: $error');
      }
    });
    if (kDebugMode) {
      print('Character Images: $characterImages');
      print('Character Names: $characterNames');
    }
  }
}
