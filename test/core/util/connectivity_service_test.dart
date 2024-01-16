import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ny_articles_app/core/network/connectivity_service.dart';
import 'connectivity_service_test.mocks.dart';


@GenerateMocks([Connectivity])
void main() {
  group('ConnectivityService', () {
    late MockConnectivity mockConnectivity;
    late ConnectivityService connectivityService;

    setUp(() {
      mockConnectivity = MockConnectivity();
      connectivityService = ConnectivityService(mockConnectivity);
    });

    test('returns true when there is a mobile connection', () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.mobile);

      expect(await connectivityService.isConnected(), isTrue);
    });

    test('returns true when there is a wifi connection', () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      expect(await connectivityService.isConnected(), isTrue);
    });

    test('returns false when there is no connection', () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      expect(await connectivityService.isConnected(), isFalse);
    });
  });
}
