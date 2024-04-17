import 'package:custom_slide_show/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowFinalPage extends StatelessWidget {
  const SlideshowFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _MiSlideshow()),
          Expanded(child: _MiSlideshow()),
        ],
      ),
    );
  }
}

class _MiSlideshow extends StatelessWidget {
  const _MiSlideshow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      colorPrimario: Colors.pink,
      puntosArriba: false,
      slides: [
        SvgPicture.asset('assets/images/slide-1.svg'),
        SvgPicture.asset('assets/images/slide-2.svg'),
        SvgPicture.asset('assets/images/slide-3.svg'),
        //SvgPicture.asset('assets/images/slide-4.svg'),
        //SvgPicture.asset('assets/images/slide-5.svg'),
      ],
    );
  }
}
