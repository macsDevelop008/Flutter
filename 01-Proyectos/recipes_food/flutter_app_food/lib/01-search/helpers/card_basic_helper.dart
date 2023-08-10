import 'package:flutter/material.dart';

class CardBasicHelper extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  const CardBasicHelper(
      {super.key,
      required this.width,
      required this.height,
      required this.child});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(size.width * 0.05)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                //offset: Offset(0, 0),
                blurRadius: 8,
                spreadRadius: 1)
          ]),
      child: child,
    );
  }
}
