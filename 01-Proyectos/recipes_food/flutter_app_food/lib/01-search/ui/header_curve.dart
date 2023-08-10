import 'package:flutter/material.dart';

class HeaderCurveUI extends StatelessWidget {
  final double scaleY;
  const HeaderCurveUI({super.key, required this.scaleY});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      height: size.height * 0.13,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurveUI(context, scaleY),
      ),
    );
  }
}

class _HeaderCurveUI extends CustomPainter {
  final double scaleY;
  final BuildContext context;

  _HeaderCurveUI(this.context, this.scaleY);
  @override
  void paint(Canvas canvas, Size size) {
    var colorOne = Theme.of(context).primaryColor;
    var colorTwo = const Color.fromARGB(255, 244, 245, 250);

    final paint = Paint();
    paint.color = colorOne.withOpacity(0.4);
    paint.strokeWidth = 5;
    paint.style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.1 * scaleY);

    path.quadraticBezierTo(size.width * 0.72, size.height * 0.17 * scaleY,
        size.width * 0.25, size.height * 0.08 * scaleY);

    path.quadraticBezierTo(size.width * 0.07, size.height * 0.06 * scaleY,
        size.width * 0, size.height * 0.09 * scaleY);

    canvas.drawPath(path, paint);

    //----

    final paint2 = Paint();
    paint2.color = colorOne;
    paint2.strokeWidth = 5;
    paint2.style = PaintingStyle.fill;

    final path2 = Path();

    path2.moveTo(0, 0);
    path2.lineTo(size.width, 0);
    path2.lineTo(size.width, size.height * 0.08 * scaleY);

    path2.quadraticBezierTo(size.width * 0.72, size.height * 0.15 * scaleY,
        size.width * 0.25, size.height * 0.06 * scaleY);

    path2.quadraticBezierTo(size.width * 0.07, size.height * 0.04 * scaleY,
        size.width * 0, size.height * 0.07 * scaleY);

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
