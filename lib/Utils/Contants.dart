// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Contants {
  //messages constants
  static String errorMessage = "Error: The repository don't exist";

  static String appTitle = 'TakeHome-Test';

  static String detailPageTitle = 'Commit Detail Page';

  static String commitUrl =
      'https://api.github.com/repos/carlosred/takeHome-Test/commits';

  //style contants
  static Color cardColor = const Color(0xffF7F7F7);

  static const errorTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const cardTittleTexStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );

  static const cardSubtittleTexStyle = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
  );
}
