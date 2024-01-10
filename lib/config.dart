import 'dart:collection';

import 'package:ny_articles_app/core/constants/string_constants.dart';

import 'core/constants/network_constants.dart';

Map<String, String> get environmentHost {

  /// use this command to run the application
  //  flutter run --dart-define=ENVIRONMENT=development
  //  flutter run --release --dart-define=ENVIRONMENT=production

  const env = String.fromEnvironment("ENVIRONMENT", defaultValue: "production");

  final Map<String, String> currentEnv = HashMap();

  switch (env) {
    case 'production':
      {
        // replace with your production API endpoint
        currentEnv.addAll({
          AppStrings.baseUrl: 'http://api.nytimes.com/svc/mostpopular/v2/',
          AppStrings.apikey: '7kVHaQFC03HhFyaXzLyv2p0e31shdnaM',
        });
      }
      break;
    case 'development':
      {
        currentEnv.addAll({
          AppStrings.baseUrl: 'http://api.nytimes.com/svc/mostpopular/v2/',
          AppStrings.apikey: '7kVHaQFC03HhFyaXzLyv2p0e31shdnaM',
        });
      }
      break;
    case 'sandbox':
      {
        currentEnv.addAll({
          AppStrings.baseUrl: 'http://api.nytimes.com/svc/mostpopular/v2/',
          AppStrings.apikey: '7kVHaQFC03HhFyaXzLyv2p0e31shdnaM',
        });
      }
      break;
    default:
      {
        currentEnv.addAll({
          AppStrings.baseUrl: 'http://api.nytimes.com/svc/mostpopular/v2/',
          AppStrings.apikey: '7kVHaQFC03HhFyaXzLyv2p0e31shdnaM',
        });
      }
      break;
  }
  return currentEnv;
}
