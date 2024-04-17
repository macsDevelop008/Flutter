import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practice_00/presentation/common/widgets/circle_gradient_widget.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        //! Solid Back
        Positioned(
            child: Container(
                height: size.height,
                width: size.width,
                color: const Color.fromARGB(255, 254, 227, 220))),
        //! Top Circle
        Positioned(
            top: size.height * -0.25,
            left: size.width * -0.15,
            child: const CircleGradientWidget(sizeCircle: .55)),
        //! Bottom Circle
        Positioned(
            bottom: size.height * -0.65,
            left: size.width * -0.75,
            child: const CircleGradientWidget(sizeCircle: 1.3)),
        //! Bloor Effect
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.white.withOpacity(0.3),
          ),
        )
      ],
    );
  }
}
