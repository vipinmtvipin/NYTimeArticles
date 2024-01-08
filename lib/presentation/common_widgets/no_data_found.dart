
import 'package:flutter/material.dart';
import 'package:ny_articles_app/core/theme/app_text_style.dart';
import 'package:ny_articles_app/core/theme/color_constant.dart';

class NoDataUI extends StatelessWidget {

  final String text;

  const NoDataUI(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      color: AppColors.whiteGray,
      child: Center(child: Text(
        text,
        style: AppTextStyle.txtBold14 ,
      ),),
    );
  }
}
