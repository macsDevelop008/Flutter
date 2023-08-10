import 'package:flutter/material.dart';

class BackgroundCurveUI extends StatelessWidget {
  const BackgroundCurveUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _BackgroundCurveUIBack(context),
      ),
    );
  }
}

class _BackgroundCurveUIBack extends CustomPainter {
  final BuildContext context;
  _BackgroundCurveUIBack(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    var colorOne = Theme.of(context).primaryColor;
    var colorTwo = const Color.fromARGB(255, 244, 245, 250);

    final paint = Paint();
    paint.color = colorOne.withOpacity(0.5);
    paint.strokeWidth = 5;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.7);

    //Curva 1
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.62,
        size.width * 0.5, size.height * 0.65);

    //Curva 2
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.72, size.width * 1,
        size.height * 0.4);

    canvas.drawPath(path, paint);

    final paint2 = Paint();
    paint2.color = colorTwo.withOpacity(1);
    paint2.strokeWidth = 5;
    paint2.style = PaintingStyle.fill;

    //--------------------------------------------------------------------------

    final path2 = Path();
    path2.moveTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.lineTo(0, size.height * 0.71);

    //Curva 1
    path2.quadraticBezierTo(size.width * 0.25, size.height * 0.64,
        size.width * 0.5, size.height * 0.67);

    //Curva 2
    path2.quadraticBezierTo(size.width * 0.9, size.height * 0.74,
        size.width * 1, size.height * 0.45);

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
