import 'package:flutter/material.dart';

import '../color_constant.dart';


class Decorations {

  static BoxDecoration get fillSecondary => const BoxDecoration(
    color: AppColors.secondaryColor,
  );

  static const BoxDecoration whiteSideCurved8 = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );


}

