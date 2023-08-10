import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget rayCloud({double width = 200}) {
  return SvgPicture.asset(
    'assets/image/svg/Complete/Nubes_Rayo.svg',
    width: width,
  );
}

Widget rainCloud({double width = 200}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        'assets/image/svg/Complete/Nubes_Lluvia.svg',
        width: width,
      ),
      SizedBox(
        width: 5,
      )
    ],
  );
}

Widget sunCloud({double width = 141}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(
        height: 10,
      ),
      SvgPicture.asset(
        'assets/image/svg/Complete/Nubes_Sol.svg',
        width: width,
      ),
    ],
  );
}

Widget aloneCloud({double width = 200}) {
  return SvgPicture.asset(
    'assets/image/svg/Complete/Nubes_Solas.svg',
    width: width,
  );
}

//Iconos---

Widget iconRayCloud({double width = 200}) {
  return SvgPicture.asset(
    'assets/image/svg/Icon/Icono_Nube_Rayo.svg',
    width: width,
  );
}

Widget iconRainCloud({double width = 200}) {
  return SvgPicture.asset(
    'assets/image/svg/Icon/Icono_Nube_Lluvia.svg',
    width: width,
  );
}

Widget iconSunCloud({double width = 200}) {
  return SvgPicture.asset(
    'assets/image/svg/Icon/Icono_Nube_Sol.svg',
    width: width,
  );
}

Widget iconAloneCloud({double width = 200}) {
  return SvgPicture.asset(
    'assets/image/svg/Icon/Icono_Nube_Sola.svg',
    width: width,
  );
}
