import 'package:flutter/material.dart';

import '../ui/ui.dart';

class CustomSliverImageView extends StatelessWidget {
  const CustomSliverImageView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SliverPersistentHeader(
        delegate: SliverCustomImageDelegateUI(
      minHeight: size.height * 0.1,
      maxHeight: size.height * 0.4,
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: size.height * 0.4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size.width * 0.15),
          child: const FadeInImage(
              fit: BoxFit.cover,
              placeholderFit: BoxFit.none,
              placeholder: AssetImage('assets/gifs/Radio-1s-200px.gif'),
              image: NetworkImage(
                'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
              )),
        ),
      ),
    ));
  }
}
