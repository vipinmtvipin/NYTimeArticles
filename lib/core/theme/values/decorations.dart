import 'package:flutter/material.dart';

import '../color_constant.dart';


class Decorations {


  static const BoxDecoration whiteSideCurved8 = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const BoxDecoration greenSideCurved8 = BoxDecoration(
    color:  AppColors.lightGreen,
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );


  static final RoundedRectangleBorder cardRectShape = RoundedRectangleBorder(
    borderRadius:  BorderRadius.circular(15.0),);

  static final RoundedRectangleBorder cardRectBorder = RoundedRectangleBorder(
    side: const BorderSide(color: Colors.black, width: 0.3,),
    borderRadius:  BorderRadius.circular(25.0),);


  static final RoundedRectangleBorder cardSqurBorder = RoundedRectangleBorder(
    side: const BorderSide(color: Colors.grey, width: 0.1,),
    borderRadius:  BorderRadius.circular(5.0),);

  static final RoundedRectangleBorder cardSqurBackgrund = RoundedRectangleBorder(
    borderRadius:  BorderRadius.circular(5.0),);

  static const BoxDecoration redRoundCurved = BoxDecoration(
    color:  AppColors.red,
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  static const BoxDecoration whiteRoundCurved20 = BoxDecoration(
    color:  AppColors.white,
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  static  BoxDecoration whiteRoundCurvfull20 = BoxDecoration(
    border: Border.all(color: Colors.white),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );



  static BoxDecoration get outlineLightBlue => BoxDecoration(
    color: AppColors.white,
    border: Border.all(
      color: AppColors.mainColor,
    ),
  );


  static BoxDecoration get fillWhiteA700 => const BoxDecoration(
    color: AppColors.white,
  );

  static BoxDecoration get txtFillWhiteA700 => const BoxDecoration(
    color: AppColors.white,
  );


}

