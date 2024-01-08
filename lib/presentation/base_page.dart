import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ny_articles_app/core/constants/string_constants.dart';
import 'package:ny_articles_app/core/theme/app_text_style.dart';

class BasePage extends StatefulWidget {
  const BasePage({required Key key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  var isLoading = false;

  void showLoadingDialog() {
    Future.delayed(Duration.zero, () {
      if (!isLoading) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return progressLoader;
            });
      }
      isLoading = true;
    });
  }

  void hideLoadingDialog() {
    if (isLoading) {
      Navigator.of(context).pop();
    }
    isLoading = false;
  }

  static final progressLoader = WillPopScope(
    // device back arrow press time did not hide the dialog
    onWillPop: () async => false,
    child: spinKitLoader,
  );

  static final spinKitLoader = Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // PouringHourGlass
        const SpinKitPouringHourGlass(
            color: Colors.white,
            strokeWidth: 2.0,
            duration: Duration(seconds: 3),
            size: kIsWeb? 55 : 50),

        const SizedBox(
          height: 13.0,
        ),

        Text(AppStrings.pleaseWait, style: AppTextStyle.txtBold12),
      ],
    ),
  );

  // common toast bar
  void showToast(String msg, {int? duration}) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}