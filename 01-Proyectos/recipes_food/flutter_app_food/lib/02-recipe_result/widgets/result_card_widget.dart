import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../01-search/helpers/helpers.dart';

class ResultCardWidget extends StatelessWidget {
  final String tile;
  final String urlRecipe;
  final String urlImage;
  final String calories;
  final String fuente;
  const ResultCardWidget(
      {super.key,
      required this.tile,
      required this.urlRecipe,
      required this.urlImage,
      required this.calories,
      required this.fuente});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                height: size.height * 0.08,
                width: double.infinity,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: _title(size),
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
                      width: size.width * 0.47,
                      height: size.height * 0.24,
                      color: Colors.transparent,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _recipe(size),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            _source(size),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            _calories(size),
                          ],
                        ),
                      ),
                    ),
                    //*Imagen
                    _image(size),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(Size size) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Text(
        tile,
        //overflow: TextOverflow.ellipsis,
        style: TextStyle(fontFamily: 'Harabara', fontSize: size.width * 0.08),
      ),
    );
  }

  Container _image(Size size) {
    return Container(
      width: size.width * 0.33,
      height: size.height * 0.24,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(size.width * 0.04)),
        child: FadeInImage(
            fit: BoxFit.cover,
            placeholderFit: BoxFit.none,
            placeholder: const AssetImage('assets/gifs/Radio-1s-50px.gif'),
            image: NetworkImage(urlImage)),
      ),
    );
  }

  Row _calories(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Calorias:',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontSize: size.width * 0.05),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        Text(
          calories,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontSize: size.width * 0.04),
        ),
      ],
    );
  }

  Row _source(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Fuente:',
          style: TextStyle(
              fontFamily: 'Roboto',
              //overflow: TextOverflow.ellipsis,
              fontStyle: FontStyle.normal,
              fontSize: size.width * 0.05),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        Text(
          (fuente.length > 15) ? '${fuente.substring(0, 12)}...' : fuente,
          //overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontSize: size.width * 0.03),
        ),
      ],
    );
  }

  Row _recipe(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Receta:',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontSize: size.width * 0.05),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        GestureDetector(
          onTap: () async {
            await _launchURL(urlRecipe);
          },
          child: Text(
            'Mira la receta',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: size.width * 0.04,
                color: Colors.blueAccent,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

//https://www.youtube.com/
  _launchURL(String url) async {
    try {
      final link = Uri.parse(url);
      if (await canLaunchUrl(link)) {
        await launchUrl(link);
      }
    } catch (e) {
      print(e);
    }
  }
}
