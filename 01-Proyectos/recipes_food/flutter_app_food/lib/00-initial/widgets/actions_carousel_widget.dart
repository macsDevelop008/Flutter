import 'package:flutter/material.dart';

class ActionsCarouselWidget extends StatelessWidget {
  const ActionsCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var color = Theme.of(context).primaryColor;

    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Saltar',
                style: TextStyle(
                    color: const Color.fromARGB(255, 190, 190, 192),
                    fontSize: size.width * 0.04,
                    fontFamily: 'Roboto'),
              )),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color)),
              child: SizedBox(
                width: size.width * 0.15,
                child: Text(
                  'Siguiente',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size.width * 0.04, fontFamily: 'Roboto'),
                ),
              ))
        ],
      ),
    );
  }
}
