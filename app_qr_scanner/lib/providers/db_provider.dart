import 'dart:io';
import 'package:app_qr_scanner/models/scan_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _databse;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  get database async {
    if (_databse != null) {
      return _databse;
    } else {
      _databse = await initDB();
    }

    return _databse!;
  }

  Future<Database> initDB() async {
    //Path almacenar la db
    Directory documentsDirectoy = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectoy.path, 'ScansDB.db');
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int verision) async {
      await db.execute('''

        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )

      ''');
    });
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final Database db =
        await database; //Verificar la db, que ya exista y/o se inicialice
    /*
    //forma 1 - larga

    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    final res = await db.rawInsert('''
      INSERT INTO Scans( id, tipo, valor )
        VALUES( $id, '$tipo', '$valor')
    ''');

    return res;*/

    //Forma 2 - corta
    final res = await db.insert('Scans', nuevoScan.toMap());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final Database db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromMap(res.first) : null;
  }

  Future<List<ScanModel>?> getScanTodosScans() async {
    final Database db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  }

  Future<List<ScanModel>?> getScanScansPorTipo(String tipo) async {
    final Database db = await database;
    final res = await db.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);
    /*final res = await db.rawQuery('''

      SELECT * FROM Scans WHERE tipo = $tipo

    ''');*/
    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final Database db = await database;
    final res = await db.update('Scans', nuevoScan.toMap(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final Database db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final Database db = await database;
    final res = await db.delete('Scans');
    return res;
  }
}
