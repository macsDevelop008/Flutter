import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';

//Provider para controlar un contador,
//maneja datos tipo entero
final counterProvider = StateProvider<int>((ref) {
  return 5;
});

//Provider para controlar el tema de la app
final isDarkModeProvider = StateProvider<bool>((ref) {
  return false;
});

//Provider para controlar el nombre aleatorio
final randomNameProvider = StateProvider<String>((ref) {
  return RandomGenerator.getRandomName();
});
