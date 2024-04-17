import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;
  const Slideshow(
      {super.key,
      required this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12.0,
      this.bulletSecundario = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SliderModel>(context).colorPrimario =
                this.colorPrimario;
            Provider.of<_SliderModel>(context).colorSecundario =
                this.colorSecundario;

            Provider.of<_SliderModel>(context).bulletPrimario =
                this.bulletPrimario;

            Provider.of<_SliderModel>(context).bulletSecundario =
                this.bulletSecundario;

            return _CRearEstructuraSlideshow(
                puntosArriba: puntosArriba, slides: slides);
          },
        )),
      ),
    );
  }
}

class _CRearEstructuraSlideshow extends StatelessWidget {
  const _CRearEstructuraSlideshow({
    super.key,
    required this.puntosArriba,
    required this.slides,
  });

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.puntosArriba) _Dots(totalSlides: this.slides.length),
        Expanded(
            child: _Slides(
          slides: this.slides,
        )),
        if (!this.puntosArriba) _Dots(totalSlides: this.slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  const _Dots({super.key, required this.totalSlides});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: Colors.transparent,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              List.generate(this.totalSlides, (index) => _Dot(index: index))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    //final pageViweIndex = Provider.of<_SliderModel>(context).currentPage;
    final slideshowModel = Provider.of<_SliderModel>(context);
    double tamanio = 0;
    Color color;
    if (slideshowModel.currentPage >= index - 0.5 &&
        slideshowModel.currentPage < index + 0.5) {
      tamanio = slideshowModel.bulletPrimario;
      color = slideshowModel.colorPrimario;
    } else {
      tamanio = slideshowModel.bulletSecundario;
      color = slideshowModel.colorSecundario;
    }

    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: tamanio,
      height: tamanio,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      duration: Duration(milliseconds: 200),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides({super.key, required this.slides});

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
      print('pagina actual: ${pageViewController.page}');
      //Actulizar provider, sliderModel
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page ?? 0.0;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(10.0),
      color: Colors.transparent,
      child: PageView(
          controller: pageViewController,
          children: widget.slides
              .map((slide) => _Slide(
                    slide: slide,
                  ))
              .toList()),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide({
    super.key,
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  Color get colorSecundario => this._colorSecundario;
  double get bulletPrimario => this._bulletPrimario;
  double get bulletSecundario => this._bulletSecundario;

  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  set bulletPrimario(double value) {
    this._bulletPrimario = value;
  }

  set bulletSecundario(double value) {
    this._bulletSecundario = value;
  }
}
