import 'package:flutter/material.dart';
import 'package:practice_00/presentation/common/views/background_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundView(),
    );
  }
}
