import 'package:flutter/material.dart';
import 'package:ny_articles_app/core/constants/image_constant.dart';
import 'package:ny_articles_app/core/theme/color_constant.dart';
import 'package:ny_articles_app/core/theme/values/decorations.dart';
import 'package:ny_articles_app/core/utils/size_utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Your drawer content goes here
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: Decorations.fillSecondary,
            child: Image.asset(
              ImageConstant.imgHome,
              color: AppColors.mainColor,
              width: getSize(80),
              height: getSize(80),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_filled,color: AppColors.secondaryColor,),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.list_alt,color: AppColors.secondaryColor,),
            title: const Text('Article List '),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
