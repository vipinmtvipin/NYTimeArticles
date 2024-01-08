import 'package:flutter/foundation.dart';

/// To set the common device values
class Dimensions {
  static const double webX = 15.0;
  static const double mobileX = 10.0;

  static const appTopMargin10 = kIsWeb ? webX : mobileX;
  static const appBottomMargin10 = kIsWeb ? webX : mobileX;
  static const appLeftMargin10 = kIsWeb ? webX : mobileX;
  static const appRightMargin10 = kIsWeb ? webX : mobileX;
  static const appAllMargin10 = kIsWeb ? webX : mobileX;

  static const appWidgetGap10 = kIsWeb ? 15.0 : 10.0;
  static const appWidgetGap15 = kIsWeb ? 20.0 : 15.0;
}
