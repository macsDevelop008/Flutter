import 'package:band_names/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  static const route = 'status';
  @override
  Widget build(BuildContext context) {
    final socketProvider = Provider.of<SockectProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Server Status: ${socketProvider.serverStatus}'),
          ],
        ),
      ),
    );
  }
}
