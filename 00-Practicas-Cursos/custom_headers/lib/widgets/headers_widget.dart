import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderRedondo extends StatelessWidget {
  const HeaderBorderRedondo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

//---

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    //Este container representa el "Canvas" o "Lienzo"
    //que se usa como parametro
    return Container(
        height: double.infinity,
        width: double.infinity,
        //color: Colors.amber,
        child: CustomPaint(
          painter: _HeaderDiagonal(),
        ));
  }
}

class _HeaderDiagonal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Crear el lapiz que dibujará
    final lapiz = new Paint();

    //Propiedades del lapiz
    //Color
    lapiz.color = Colors.green;
    //Estilo de bibujo - .stroke = dibujar solo bordes
    //- .fill = dibujar y rellenar
    lapiz.style = PaintingStyle.fill;
    //Ancho de la linea
    lapiz.strokeWidth = 5;

    //Posicionamiento para el dibujado
    final path = new Path();
    //Mover el lapiz a la corrdenada SIN DIBUJAR la linea
    path.moveTo(0, size.height * 0.35);
    //Mover el lapiz a la coordenada DIBUJANDO la linea
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //Realiza el dibijo pasando el path y lapiz creado
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

//---

class HeaderTriangulo extends StatelessWidget {
  const HeaderTriangulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.green,
      child: SafeArea(
        child: CustomPaint(
          painter: _HeaderTriangulo(),
        ),
      ),
    );
  }
}

class _HeaderTriangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Lapiz
    final paint = new Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    //Pintar
    final path = new Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

//---

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPico(),
      ),
    );
  }
}

class _HeaderPico extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    //Lapiz
    final paint = new Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.fill;

    //Dibujado
    final path = new Path();
    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.28);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

//---

class HeaderCurva extends StatelessWidget {
  const HeaderCurva({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurva(),
      ),
    );
  }
}

class _HeaderCurva extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    //Lapiz
    final paint = new Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.fill;

    //Dibujado
    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    //Dibujar curva con 4 parametro o coordenadas
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

//---

class HeaderDobleCurva extends StatelessWidget {
  const HeaderDobleCurva({super.key});

  @override
  Widget build(BuildContext context) {
    //Primera curva
    //final pathOne = new Path();
    //Segunda curva

    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Colors.amber,
      child: CustomPaint(
        painter: _HeaderCurvaParametros(),
      ),
    );
  }
}

class _HeaderCurvaParametros extends CustomPainter {
  final Rect rect = new Rect.fromCircle(center: Offset(0.0, 55.0), radius: 180);

  final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.green, Colors.cyan],
      stops: [0.2, 1]);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    //Lapiz
    final paint = new Paint()..shader = gradiente.createShader(rect);
    paint.color = Colors.red;
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.fill;

    //Dibujado
    final path = new Path();
    path.lineTo(0, size.height * 0.25);
    //Primera curva
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.25);
    //Segunda curva
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.16, size.width, size.height * 0.28);
    //
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
