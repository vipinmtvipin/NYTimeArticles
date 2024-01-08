import 'package:ny_articles_app/core/constants/string_constants.dart';

import '../../config.dart' show environmentHost;

/// Constants for Rest api's
class NetworkKeys {
  NetworkKeys._();

  static String base_url = environmentHost[AppStrings.baseUrl]!;

  static const String login = '/auth/login';
  static const String products = '/products';
}
