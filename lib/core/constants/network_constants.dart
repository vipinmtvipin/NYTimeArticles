import 'package:ny_articles_app/core/constants/string_constants.dart';
import '../../config.dart' show environmentHost;

/// Constants for Rest api's
class NetworkKeys {
  NetworkKeys._();

  static String baseUrl = environmentHost[AppStrings.baseUrl]!;

  static const String articleList = '/mostviewed/all-sections/7.json';

}
