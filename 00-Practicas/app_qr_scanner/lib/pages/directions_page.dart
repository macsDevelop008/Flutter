import 'package:flutter/material.dart';
import '../widgets/scan_list.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScanList(tipo: 'http');
  }
}
