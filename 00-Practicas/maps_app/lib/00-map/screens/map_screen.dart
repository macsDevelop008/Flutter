import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CameraPosition initialCameraPosition = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 15);
    return Scaffold(
      body: Center(
        child: GoogleMap(initialCameraPosition: initialCameraPosition),
      ),
    );
  }
}
