import 'package:app/core/constants/app_endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class BaseService<T> extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppEndpoints.baseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 20);
    httpClient.addResponseModifier(
      (request, response) async {
        if (kDebugMode) {
          print(
              "----------------------------------------------------------------------------------------------------");
          print("[REQUEST] - [${request.method} : ${request.url}]");
          print("[RESPONSE] - [${response.body}]");
          print(
              "----------------------------------------------------------------------------------------------------");
        }
      },
    );
    httpClient.addRequestModifier<T>((request) async {
      // Check internet here
      return request as Request<T>;
    });
    super.onInit();
  }

  /*List<T> _listDecoder<T>(
      List encodedItemList, T Function(dynamic json) decoder) {
    List<T> decodedItemList = [];
    for (var json in encodedItemList) {
      T object = decoder(json);
      decodedItemList.add(object);
    }
    return decodedItemList;
  }

  Future<List<T>> getItemList<T>(String route, T Function(dynamic json) decoder,
      [bool isSecure = true]) async {
    Response response = await get(
      route,
      headers: isSecure ? secureHeaders : null,
      decoder: (response) {
        return response is List ? _listDecoder<T>(response, decoder) : <T>[];
      },
    );

    if (response.status.isOk) {
      return response.body;
    } else if (response.status.isUnauthorized) {
      throw ExpiredSessionException();
    } else if (response.status.isForbidden) {
      throw UserLockedException();
    } else {
      throw UnknownErrorException();
    }
  }

  Future<T> getSingleItem<T>(String route, T Function(dynamic json) decoder,
      [bool isSecure = true]) async {
    Response response = await get(
      route,
      headers: isSecure ? secureHeaders : null,
      decoder: (response) {
        return decoder(response);
      },
    );

    if (response.isOk) {
      return response.body;
    } else if (response.status.isUnauthorized) {
      throw ExpiredSessionException();
    } else if (response.status.isForbidden) {
      throw UserLockedException();
    } else {
      throw UnknownErrorException();
    }
  }*/
}
