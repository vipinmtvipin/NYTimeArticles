import 'package:flutter/material.dart';

import '../constants/string_constants.dart';
import 'color_constant.dart';

/// generic Text style class,
/// we can define our text variables based on our use cases
class AppTextStyle {

  static TextStyle txtBold10 = const TextStyle(
    color: AppColors.black,
    fontSize: 10,
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtBold12 = const TextStyle(
    color: AppColors.black,
    fontSize: 12,
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtBold14 = const TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtBold16 = const TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontFamily: AppStrings.fontName,
    fontWeight: FontWeight.w700,
  );
}
