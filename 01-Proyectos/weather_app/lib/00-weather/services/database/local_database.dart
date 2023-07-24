import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/00-weather/models/models.dart';

class LocalDatabase {
  static Database? _database;

  static final LocalDatabase db = LocalDatabase._();
  LocalDatabase._();

  Future<Database> get database async {
    if (_database != null) _database;

    _database = await initDB();
    //insertPlace(BasicPlaceModel('4.438315', '-75.198871'));
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'WeatherAppDB.db');
    var result = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
      
      CREATE TABLE IF NOT EXISTS places(
        id INTEGER PRIMARY KEY,
        lat TEXT,
        lon TEXT
      )

      ''');
    });
    //insertPlace(BasicPlaceModel('4.438315', '-75.198871'));
    return result;
  }

  Future<int> insertPlace(BasicPlaceModel basicPlaceModel) async {
    try {
      final db = await database;
      final res = await db.insert('places', basicPlaceModel.toJson());
      // ignore: avoid_print
      print('Ingreso de lugar res N°: $res');
      return res;
    } catch (e) {
      // ignore: avoid_print
      print('Error al ingresar el lugar: $e');
      return -1;
    }
  }

  Future<List<BasicPlaceModel>?> getAllPlaces() async {
    try {
      final db = await database;
      final res = await db.query('palces');
      return res.isNotEmpty
          ? res.map((p) => BasicPlaceModel.fromJson(p)).toList()
          : null;
    } catch (e) {
      print('Error al listar: $e');
      return null;
    }
  }
}
