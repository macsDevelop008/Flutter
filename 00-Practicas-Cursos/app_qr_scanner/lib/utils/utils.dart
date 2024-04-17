import 'package:app_qr_scanner/models/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final _url = scan.valor;

  if (scan.tipo == 'http') {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
