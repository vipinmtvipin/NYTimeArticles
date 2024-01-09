import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ny_articles_app/core/theme/color_constant.dart';
import 'package:ny_articles_app/core/utils/size_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {super.key,
        this.height,
        this.leadingWidth,
        this.leading,
        this.title,
        this.centerTitle,
        this.actions});

  double? height;

  double? leadingWidth;

  Widget? leading;

  Widget? title;

  bool? centerTitle;

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      toolbarHeight: getSize(50),
      automaticallyImplyLeading: true,
      backgroundColor: AppColors.secondaryColor,
      leadingWidth: leadingWidth ?? 50,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
    size.width,
    height ?? (kIsWeb ? getSize(65) : getSize(50)),
  );
}
