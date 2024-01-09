
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_articles_app/core/network/connectivity_service.dart';


void main() {
  group('ConnectionService', () {
    late ConnectivityService connectionUtil;

    setUp(() {
      connectionUtil = ConnectivityService();
    });

    test('isConnected returns true when there is an internet connection', () {
      final isConnected = connectionUtil.isConnected();
      expect(isConnected, true);
    });
  });
}
