import 'dart:async';
import 'package:app/core/error/error_messages.dart';
import 'package:app/core/error/exceptions.dart';
import 'package:app/core/network/network_info.dart';
import 'package:app/core/routes/app_endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class BaseService extends GetConnect {
  final INetworkInfo _networkInfo;

  BaseService(this._networkInfo);

  @override
  void onInit() {
    httpClient.baseUrl = AppEndpoints.baseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 20);
    httpClient.addResponseModifier(_loggingInterceptor);
    super.onInit();
  }

  FutureOr<Response> _loggingInterceptor(
    Request request,
    Response response,
  ) async {
    if (kDebugMode) {
      print(
          "---------------------------------------------------------------------------------------------------------------------------");
      print("[REQUEST] : [${request.method.toUpperCase()} ${request.url}]");
      print("[REQUEST BODY] : []");
      print("[RESPONSE STATUS CODE] : [${response.statusCode}]");
      print("[RESPONSE BODY] : [${response.bodyString}]");
      print(
          "---------------------------------------------------------------------------------------------------------------------------");
    }
    return response;
  }

  void _networkInterceptor() async {
    if (!(await _networkInfo.isConnected)) {
      throw NoInternetException(AppErrorMessages.noInternet);
    }
  }

  List<T> listDecoder<T>(List list, T Function(dynamic json) decoder) {
    return list.map((item) => decoder(item)).toList();
  }
}
