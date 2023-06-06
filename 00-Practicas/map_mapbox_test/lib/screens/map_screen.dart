import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  static const TOKEN_MAPBOX_API =
      'pk.eyJ1IjoibWlndWU0NTU1IiwiYSI6ImNsaWM2ajNwYTBoaDAzY24xdWlkcnhtbWgifQ.d0_Npi75Ud4OhauSY8Ujtg';
  final myPosition = LatLng(4.446293, -75.174305);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: const Text('Material App Bar'),
        ),
        body: FlutterMap(
          options: MapOptions(
            center: myPosition,
            minZoom: 5,
            maxZoom: 25,
            zoom: 18,
          ),
          nonRotatedChildren: [
            TileLayer(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
              additionalOptions: {
                'accessToken': TOKEN_MAPBOX_API,
                'id': 'mapbox/streets-v12'
              },
            )
          ],
        ));
  }
}
