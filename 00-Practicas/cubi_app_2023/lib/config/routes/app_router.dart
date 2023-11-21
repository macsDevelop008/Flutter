import 'package:cubi_app_2023/presentation/pokemon/screens/one_screen.dart';
import 'package:cubi_app_2023/presentation/pokemon/screens/three_screen.dart';
import 'package:cubi_app_2023/presentation/pokemon/screens/two_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/', //-> Pantalla inicial segun la ruta
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OneScreen(),
    ),
    GoRoute(
      path: '/two',
      builder: (context, state) => const TwoScreen(),
    ),
    GoRoute(
      name: 'three_screen',
      path: '/three',
      builder: (context, state) => const ThreeScreen(),
    ),
  ],
);
