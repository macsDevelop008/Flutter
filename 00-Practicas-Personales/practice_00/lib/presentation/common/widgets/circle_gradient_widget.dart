import 'package:flutter/material.dart';

import 'dart:math' as math;

class CircleGradientWidget extends StatelessWidget {
  final double sizeCircle;
  const CircleGradientWidget({super.key, required this.sizeCircle});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: 120 * math.pi / 180,
      child: Container(
        alignment: Alignment.center,
        width: size.width * sizeCircle,
        height: size.height * sizeCircle,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 210, 103, 233),
              Color.fromARGB(255, 255, 142, 102)
            ])),
      ),
    );
  }
}
