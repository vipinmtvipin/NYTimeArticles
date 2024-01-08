import 'package:flutter/material.dart';

import '../color_constant.dart';


class Gradients {

  static const Gradient mainBackgroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.mainColor,
        AppColors.secondaryColor,
      ]);

  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment(0.9661, 0.5),
    end: Alignment(0, 0.5),
    stops: [
      0,
      1,
    ],
    colors: [
      Color.fromARGB(255, 255, 86, 115),
      Color.fromARGB(255, 255, 140, 72),
    ],
  );

}
