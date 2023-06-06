import 'package:app_qr_scanner/widgets/scan_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScanList(tipo: 'geo');
  }
}
