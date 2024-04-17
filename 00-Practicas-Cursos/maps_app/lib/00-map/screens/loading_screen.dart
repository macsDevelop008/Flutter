import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/00-map/blocs/blocs.dart';
import 'package:maps_app/00-map/screens/screens.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        return state.isAllGranted ? MapScreen() : GpsAccessScreen();
      },
    ));
  }
}
