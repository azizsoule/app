import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements INetworkInfo {
  final Connectivity _connectivity;

  NetworkInfo(this._connectivity);

  @override
  Future<bool> get isConnected async {
    return (await _connectivityResult) != ConnectivityResult.none &&
        (await _hasConnection);
  }

  Future<ConnectivityResult> get _connectivityResult async =>
      await _connectivity.checkConnectivity();

  Future<bool> get _hasConnection async {
    try {
      final result = await InternetAddress.lookup('https://www.google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
