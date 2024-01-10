import 'package:flutter/material.dart';
import 'package:ny_articles_app/core/theme/app_text_style.dart';
import 'package:ny_articles_app/core/theme/color_constant.dart';
import 'package:ny_articles_app/core/theme/values/dimensions.dart';
import 'package:ny_articles_app/core/utils/size_utils.dart';

class NoDataUI extends StatelessWidget {
  final String text;

  const NoDataUI(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGray,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.file_copy_outlined, size: getSize(50),),
          const SizedBox(height: Dimensions.appWidgetGap20,),
          Text(
            text,
            style: AppTextStyle.txtBlackBold14,
          ),
        ],
      ),
    );
  }
}
