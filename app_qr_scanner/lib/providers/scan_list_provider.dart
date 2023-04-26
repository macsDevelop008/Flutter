import 'package:app_qr_scanner/models/scan_model.dart';
import 'package:app_qr_scanner/providers/db_provider.dart';
import 'package:flutter/material.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScanRaw(nuevoScan);
    //Asignar id de la db al model
    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
    //this.scans.add(nuevoScan);
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getScanTodosScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  cargarScansPoTipo(String tipo) async {
    final scans = await DBProvider.db.getScanScansPorTipo(tipo);
    this.scans = [...scans!];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  borrarPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    cargarScansPoTipo(this.tipoSeleccionado);
    //notifyListeners();
  }
}
