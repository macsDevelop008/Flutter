import 'package:flutter/material.dart';

succesFullyModalHelper(BuildContext context, Size size) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        );
      });
}
