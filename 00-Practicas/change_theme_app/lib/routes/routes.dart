import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Page 1'),
  _Route(FontAwesomeIcons.amilia, 'Page 2'),
  _Route(FontAwesomeIcons.radio, 'Page 3'),
  _Route(FontAwesomeIcons.hammer, 'Page 4'),
  _Route(FontAwesomeIcons.quinscape, 'Page 5'),
  _Route(FontAwesomeIcons.calculator, 'Page 6'),
  _Route(FontAwesomeIcons.ideal, 'Page 7'),
  _Route(FontAwesomeIcons.wandSparkles, 'Page 8'),
];

class _Route {
  final IconData icon;
  final String title;
  //final Widget _page;

  _Route(this.icon, this.title);
}
