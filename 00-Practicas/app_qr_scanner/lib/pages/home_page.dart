import 'package:app_qr_scanner/models/scan_model.dart';
import 'package:app_qr_scanner/pages/directions_page.dart';
import 'package:app_qr_scanner/pages/maps_page.dart';
import 'package:app_qr_scanner/providers/db_provider.dart';
import 'package:app_qr_scanner/providers/scan_list_provider.dart';
import 'package:app_qr_scanner/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_navigator_bar.dart';
import '../widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Historial',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    //Usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPoTipo('geo');
        return MapsPage();
      case 1:
        scanListProvider.cargarScansPoTipo('http');
        return DirectionsPage();
      default:
        return MapsPage();
    }

    return Container();
  }
}
