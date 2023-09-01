import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/initial_service.dart';

class ActionsCarouselWidget extends StatelessWidget {
  const ActionsCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<InitialService>(context);
    var size = MediaQuery.of(context).size;
    var color = Theme.of(context).primaryColor;

    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElasticIn(
            child: TextButton(
                onPressed: () async {
                  service.skiptButton(context);
                },
                child: Text(
                  'Omitir',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 190, 190, 192),
                      fontSize: size.width * 0.04,
                      fontFamily: 'Roboto'),
                )),
          ),
          ElasticIn(
            child: ElevatedButton(
                onPressed: () {
                  service.carouselNext(context);
                },
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
                )),
          )
        ],
      ),
    );
  }
}
