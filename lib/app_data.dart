import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppData with ChangeNotifier {
  List<Map<String, List<String>>> characters = [];
  List<Map<String, String>> demons = [];
  List<Map<String, String>> weapons = [];

  Future<void> addCharacters() async {
    String dbPath = join(await getDatabasesPath(), 'doom.db');
    
    Database database = await openDatabase(
      dbPath,
      version: 1,
    );

    await database.transaction((txn) async {
      for (int id = 1; id < 7; id++) {
        List<String> characterRaces = [];
        List<String> characterSexes = [];
        List<String> characterStatus = [];
        List<String> characterActors = [];
        List<String> characterDescriptions = [];
        List<String> characterImages = [];
        List<String> characterNames = [];
        
        List<Map<String, dynamic>> character = await txn.rawQuery(
          'SELECT race, sex, status, voice_actor, description '
          'FROM characters '
          'WHERE id = $id'
        );

        for (Map<String, dynamic> row in character) {
          if (!characterRaces.contains(row['race']) &&!characterSexes.contains(row['sex']) && !characterStatus.contains(row['status']) &&
              !characterActors.contains(row['actor']) && !characterDescriptions.contains(row['description'])) {
            characterRaces.add(row['race']);
            characterSexes.add(row['sex']);
            characterStatus.add(row['status']);
            characterActors.add(row['voice_actor']);
            characterDescriptions.add(row['description']);
          }
        }
        
        List<Map<String, dynamic>> images = await txn.rawQuery(
          'SELECT content, name '
          'FROM images '
          'WHERE id_character = $id'
        );

        for (Map<String, dynamic> row in images) {
          if (!characterImages.contains('./assets/characters/${row['content']}') &&!characterNames.contains(row['name'])) {
            characterImages.add('./assets/characters/${row['content']}');
            characterNames.add(row['name']);
          }
        }

        characters.add({
          'race': characterRaces,
          'sex': characterSexes,
          'status': characterStatus,
          'voice_actor': characterActors,
          'description': characterDescriptions,
          'images': characterImages,
          'names': characterNames,
        });
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Error opening database: $error');
      }
    });
  }
}
