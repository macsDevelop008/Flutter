import 'package:flutter/material.dart';

import '../ui/ui.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          width: double.infinity,
          height: size.height * 0.7,
          child: const FadeInImage(
              fit: BoxFit.cover,
              placeholderFit: BoxFit.none,
              placeholder: AssetImage('assets/gifs/Radio-1s-200px.gif'),
              image: NetworkImage(
                'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
              )),
        ),
        const BackgroundCurveUI(),
      ],
    );
  }
}
