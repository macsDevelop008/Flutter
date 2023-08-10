import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

dialogAddWeather(BuildContext context, bool correct, String message) {
  var size = MediaQuery.of(context).size;
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title:
                (correct) ? const Text('CORRECTO') : const Text('INCORRECTO'),
            icon: (correct)
                ? const Icon(
                    Icons.mood_outlined,
                    size: 100,
                    color: Colors.greenAccent,
                  )
                : const Icon(
                    Icons.mood_bad_outlined,
                    size: 100,
                    color: Colors.redAccent,
                  ),
            actions: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    size: 25,
                  ))
            ],
            content: Container(
              alignment: Alignment.center,
              width: size.width * 0.3,
              height: size.height * 0.05,
              child: Text(
                message,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ));
}

openLoadingCustom(BuildContext context) {
  //var size = MediaQuery.of(context).size;
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
              child: const SizedBox(
                height: 10,
                width: 10,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballBeat,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ));
}

closeLoadingCustom(BuildContext context) {
  Navigator.pop(context);
}
