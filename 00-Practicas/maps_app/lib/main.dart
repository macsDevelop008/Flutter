import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/00-map/screens/screens.dart';

import '00-map/blocs/blocs.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => GpsBloc())],
      child: const MapsApp()));
}

class MapsApp extends StatelessWidget {
  const MapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoadingScreen());
  }
}
