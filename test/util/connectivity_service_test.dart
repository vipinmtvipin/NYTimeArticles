
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_articles_app/core/network/connectivity_service.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ConnectionService', () {
    late ConnectivityService connectionUtil;

    setUp(() {
      connectionUtil = ConnectivityService();
    });

    test('isConnected returns true when there is an internet connection', () {
      // Act
      final isConnected = connectionUtil.isConnected();
      // Assert
      expect(isConnected, true);
    });
  });
}
