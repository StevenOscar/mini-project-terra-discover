import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:terra_discover_project/models/custom_character_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  final String _tableName = "Custom_char";
  static late Database _database;

  DatabaseHelper._internal(){
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'custom_char_db.db'),
      onCreate: (db,version) async {
        return db.execute(
          ''' CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            image_hash TEXT,
            rarity int,
            main_class TEXT,
            talent TEXT,
            skill TEXT
          )
          '''
        );
      },
      version: 1
    );
    return db;
  }

  Future<void> addCustomCharacter ({required CustomCharacterModel customCharacterModel}) async {
    final Database db = await database;
    await db.insert(_tableName, customCharacterModel.toMap());
  }

  Future<List<CustomCharacterModel>> getCustomCharacter () async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((e) => CustomCharacterModel.fromMap(e)).toList();
  }

  Future<void> deleteCustomCharacter({required int id}) async {
    final db = await database;
    await db.delete(_tableName,
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future<int> getHighestId() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT MAX(id) as maxId FROM $_tableName;'
    );

    int highestId = result.isNotEmpty ? result.first['maxId'] ?? 0 : 0;
    return highestId;
  }

}