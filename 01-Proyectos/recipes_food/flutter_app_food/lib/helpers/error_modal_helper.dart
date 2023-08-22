import 'package:flutter/material.dart';

errorModalHelper(BuildContext context, Size size, String text) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                height: size.height * 0.42,
                width: size.width * 0.9,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    //*Base
                    _base(size, context),
                    //*Circulo decoración
                    _circleDecoration(size, context),
                    //*Texto
                    _text(size, text)
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              _buttonClose(size, context)
            ],
          ),
        );
      });
}

IconButton _buttonClose(Size size, BuildContext context) {
  return IconButton(
      iconSize: size.width * 0.12,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.close,
        size: size.width * 0.12,
        color: Colors.white,
      ));
}

Positioned _text(Size size, String text) {
  return Positioned(
      bottom: size.height * 0.06,
      child: Column(
        children: [
          Text(
            'Error',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: size.width * 0.045,
                color: Colors.black.withOpacity(0.4)),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: 'Harabara',
                fontSize: size.width * 0.045,
                color: Colors.black.withOpacity(1)),
          ),
        ],
      ));
}

Positioned _circleDecoration(Size size, BuildContext context) {
  return Positioned(
    top: size.height * 0.01,
    child: Stack(
      alignment: Alignment.center,
      children: [
        _circle(size, 0.28),
        _circle(size, 0.24),
        _circle(size, 0.2),
        CircleAvatar(
          backgroundColor: Colors.redAccent,
          radius: size.width * 0.16,
          child: Icon(
            Icons.warning_amber_outlined,
            color: Colors.white,
            size: size.width * 0.2,
          ),
        ),
      ],
    ),
  );
}

Positioned _base(Size size, BuildContext context) {
  return Positioned(
    child: Container(
      width: size.width * 0.8,
      height: size.height * 0.3,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.27,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(size.height * 0.03))),
          ),
          Container(
            width: size.width * 0.65,
            height: size.height * 0.02,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(size.width * 0.1),
                    bottomRight: Radius.circular(size.width * 0.1))),
          ),
        ],
      ),
    ),
  );
}

CircleAvatar _circle(Size size, double radius) {
  return CircleAvatar(
    backgroundColor: Colors.blue.withOpacity(0.03),
    radius: size.width * radius,
  );
}
