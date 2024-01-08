
import 'package:flutter/material.dart';
import 'package:ny_articles_app/core/utils/navigation_args.dart';

class MyNavigator {

  static void goToNextPage(BuildContext context,String keypage) {
    Navigator.of(context).pushNamed(keypage);
  }

  static void goToNextPageWithArgument(BuildContext context,String keypage,NavigationArgs arguments) {
    Navigator.of(context).pushNamed(keypage,arguments: arguments);
  }

  static void goToReplaceNextPage(BuildContext context,String keypage) {
    Navigator.of(context).pushReplacementNamed(keypage);
  }

  static void goToReplaceNextPageWithArgument(BuildContext context,String keypage,NavigationArgs arguments) {
    Navigator.of(context).pushReplacementNamed(keypage,arguments: arguments);
  }

  static void removePageUntil(BuildContext context,String keypage, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => page
        ),
        ModalRoute.withName(keypage)
    );
  }

  static void popUp(BuildContext context) {
    Navigator.of(context).pop();
  }
  static void popUpWithArgument(BuildContext context,NavigationArgs arguments) {
    Navigator.of(context).pop(arguments);
  }
}
