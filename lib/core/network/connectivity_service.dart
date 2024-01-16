
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {

  final Connectivity _connectivity;

  ConnectivityService(this._connectivity);

   Future<bool> isConnected() async {
    var connectivity = await (_connectivity.checkConnectivity());
    if (connectivity == ConnectivityResult.mobile ||
        connectivity == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
