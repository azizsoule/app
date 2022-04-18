import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    return (await connectivityResult) != ConnectivityResult.none;
  }

  Future<ConnectivityResult> get connectivityResult async =>
      await connectivity.checkConnectivity();
}
