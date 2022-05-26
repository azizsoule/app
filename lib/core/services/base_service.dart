import 'dart:async';
import 'package:app/core/error/error_messages.dart';
import 'package:app/core/error/exceptions.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/core/routes/app_endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class BaseService<T> extends GetConnect {
  final INetworkInfo _networkInfo;

  BaseService(this._networkInfo);

  @override
  void onInit() {
    httpClient.baseUrl = AppEndpoints.baseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 20);
    httpClient.addResponseModifier<T>(_loggingInterceptor);
    httpClient.addRequestModifier<T>(_networkInterceptor);
    super.onInit();
  }

  FutureOr<Response> _loggingInterceptor(Request<T?> request, Response<T?> response) {
    if (kDebugMode) {
      print(
          "----------------------------------------------------------------------------------------------------");
      print("[REQUEST] - [${request.method} : ${request.url}]");
      print("[RESPONSE] - [${response.body}]");
      print(
          "----------------------------------------------------------------------------------------------------");
    }
    return response;
  }

  FutureOr<Request<T>> _networkInterceptor(Request<T?> request) async {
    if (await _networkInfo.isConnected) {
      return request as Request<T>;
    } else {
      throw NoInternetException(AppErrorMessages.noInternet);
    }
  }

  List<T> listDecoder(List list, T Function(dynamic json) decoder) {
    return list.map((item) => decoder(item)).toList();
  }
}
