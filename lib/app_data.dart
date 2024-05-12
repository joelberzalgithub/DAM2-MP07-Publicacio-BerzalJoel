import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class AppData with ChangeNotifier {
  Future<void> showCharacterById(Database db, int id) async {
    try {
      List<Map<String, dynamic>> result = await db.rawQuery('SELECT c.id, i.content, i.name, '
                                                                    'c.race, c.sex, c.status, c.voice_actor, c.description'
                                                            'FROM characters c'
                                                            'JOIN images i ON c.id = i.id_character'
                                                            'WHERE c.id = $id');
      for (Map<String, dynamic> row in result) {
        if (kDebugMode) {
          print('Id: ${row['id']}; '
                'Image Content: ${row['content']}; '
                'Name: ${row['name']}; '
                'Race: ${row['race']}; '
                'Sex: ${row['sex']}; '
                'Status: ${row['status']}; '
                'Voice Actor: ${row['voice_actor']}; '
                'Description: ${row['description']}; ');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  Future<void> showDemonById(Database db, int id) async {
    try {
      List<Map<String, dynamic>> result = await db.rawQuery('SELECT d.id, i.content, i.name, '
                                                                    'd.class, d.rank, d.health_points, d.damage, d.description'
                                                            'FROM demons d'
                                                            'JOIN images i ON d.id = i.id_demon'
                                                            'WHERE d.id = $id');
      for (Map<String, dynamic> row in result) {
        if (kDebugMode) {
          print('Id: ${row['id']}; '
                'Image Content: ${row['content']}; '
                'Name: ${row['name']}; '
                'Class: ${row['class']}; '
                'Rank: ${row['rank']}; '
                'Health Points: ${row['health_points']}; '
                'Damage: ${row['damage']}; '
                'Description: ${row['description']}; ');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  Future<void> showWeaponById(Database db, int id) async {
    try {
      List<Map<String, dynamic>> result = await db.rawQuery('SELECT d.id, i.content, i.name, '
                                                                    'd.type, d.fire_mode, d.ammo_type, d.damage, d.description'
                                                            'FROM weapons w'
                                                            'JOIN images i ON w.id = i.id_weapon'
                                                            'WHERE d.id = $id');
      for (Map<String, dynamic> row in result) {
        if (kDebugMode) {
          print('Id: ${row['id']}; '
                'Image Content: ${row['content']}; '
                'Name: ${row['name']}; '
                'Type: ${row['type']}; '
                'Fire Mode: ${row['fire_mode']}; '
                'Ammo Type: ${row['ammo_type']}; '
                'Damage: ${row['damage']}; '
                'Description: ${row['description']}; ');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}
