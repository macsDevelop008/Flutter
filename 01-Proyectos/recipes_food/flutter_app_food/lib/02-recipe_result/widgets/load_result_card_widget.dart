import 'package:flutter/material.dart';

import '../../01-search/helpers/helpers.dart';

class LoadResultCardWidget extends StatelessWidget {
  const LoadResultCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var colors = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: size.width * 0.06),
      child: CardBasicHelper(
        height: size.height * 0.27,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.015),
          child: Column(
            children: [
              //*TITULO
              Container(
                height: size.height * 0.06,
                width: double.infinity,

                alignment: Alignment.center,
                decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius:
                        BorderRadius.all(Radius.circular(size.width * 0.1)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          colors.primaryColor.withOpacity(0.5),
                          Colors.white
                        ])),
                //child: _title(size),
              ),
              SizedBox(
                height: size.height * 0.017,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: size.height * 0.16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //*Data
                    Container(
                      width: size.width * 0.44,
                      height: size.height * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.width * 0.05)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                colors.primaryColor.withOpacity(0.5),
                                Colors.white
                              ])),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    //*Imagen
                    Container(
                      width: size.width * 0.37,
                      height: size.height * 0.24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.width * 0.05)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                colors.primaryColor.withOpacity(0.5),
                                Colors.white
                              ])),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
