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

  static final RoundedRectangleBorder cardRectBorder = RoundedRectangleBorder(
    side: const BorderSide(color: Colors.black, width: 0.3,),
    borderRadius:  BorderRadius.circular(25.0),);


}

