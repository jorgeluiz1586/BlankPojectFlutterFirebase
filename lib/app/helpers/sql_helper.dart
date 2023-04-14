import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE cars(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        maker TEXT,
        model TEXT,
        manufacture_year INTEGER,
        model_year INTEGER,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'blankproject.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
      {required String model,
      required String maker,
      required int manufactureYear,
      required int modelYear}) async {
    final db = await SQLHelper.db();

    final data = {
      'model': model,
      'maker': maker,
      'manufacture_year': manufactureYear,
      'model_year': modelYear,
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    };
    final id = await db.insert('cars', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('cars', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('cars', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      {required int id,
      required String model,
      required String maker,
      required int manufactureYear,
      required int modelYear}) async {
    final db = await SQLHelper.db();

    final data = {
      'model': model,
      'maker': maker,
      'manufacture_year': manufactureYear,
      'model_year': modelYear,
      'updated_at': DateTime.now().toString(),
    };

    final result =
        await db.update('cars', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("cars", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
