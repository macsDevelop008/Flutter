import 'package:app_qr_scanner/providers/scan_list_provider.dart';
import 'package:app_qr_scanner/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          /*String barCodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8DEF', 'Calcelar', false, ScanMode.QR);*/
          //print(barcodeScanRes);
          final barCodeScanRes = 'https://www.youtube.com';

          if (barCodeScanRes == -1) {
            return;
          }

          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          //scanListProvider.nuevoScan(barCodeScanRes);
          final nuevoScan =
              await scanListProvider.nuevoScan('geo:4.446301,-75.174302');

          launchURL(context, nuevoScan);
        });
  }
}
