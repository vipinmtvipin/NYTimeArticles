import 'package:flutter/material.dart';
import 'package:ny_articles_app/core/utils/size_utils.dart';

import '../constants/string_constants.dart';
import 'color_constant.dart';

/// generic Text style class,
/// we can define our text variables based on our use cases
class AppTextStyle {

  static TextStyle txtBold10 =  TextStyle(
    color: AppColors.white,
    fontSize: getFontSize(10),
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtBlack16 =  TextStyle(
    color: AppColors.black,
    fontSize: getFontSize(16),
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w400,
  );

  static TextStyle wTxtGray20 =  const TextStyle(
    color: AppColors.gray,
    fontSize: 20,
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w400,
  );
  static TextStyle txtGray16 =  TextStyle(
    color: AppColors.gray,
    fontSize: getFontSize(16),
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w400,
  );


  static TextStyle txtBold18 =  TextStyle(
    color: AppColors.white,
    fontSize: getFontSize(18),
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w700,
  );

  static TextStyle wTxtBold25 =  const TextStyle(
    color: AppColors.white,
    fontSize: 25,
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w700,
  );
  static TextStyle wTxtBlack20 =  const TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtBlackBold14 =  TextStyle(
    color: AppColors.black,
    fontSize: getFontSize(14),
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w700,
  );
}
