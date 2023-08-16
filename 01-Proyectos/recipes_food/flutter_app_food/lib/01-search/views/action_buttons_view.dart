import 'package:flutter/material.dart';

class ActionButtonsView extends StatelessWidget {
  const ActionButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var colors = Theme.of(context);
    return Column(
      children: [
        _button(colors.primaryColor, size, () {}, Icons.search_sharp),
        SizedBox(
          height: size.height * 0.02,
        ),
        _button(Colors.redAccent, size, () {}, Icons.delete),
      ],
    );
  }

  FloatingActionButton _button(
      Color color, Size size, Function()? function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      backgroundColor: color,
      child: Icon(
        icon,
        size: size.width * 0.08,
      ),
    );
  }
}
