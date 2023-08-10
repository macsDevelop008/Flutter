import 'package:flutter/material.dart';

class GeneralTheme {
  get lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: const Color.fromARGB(255, 107, 197, 125),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return const Color.fromARGB(255, 107, 197, 125);
          }
          return null;
        }),
      ),
      colorScheme: ThemeData.light()
          .colorScheme
          .copyWith(secondary: const Color.fromARGB(255, 216, 236, 226)),
      scaffoldBackgroundColor: const Color.fromARGB(255, 244, 245, 250),
    );
  }
}
