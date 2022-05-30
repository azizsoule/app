import 'package:app/core/error/error_messages.dart';
import 'package:app/core/error/exceptions.dart';
import 'package:app/core/services/base_service.dart';
import 'package:get/get.dart';
import '../network/network_info.dart';

class HttpHelper {
  final INetworkInfo _networkInfo;

  final BaseService _baseService;

  const HttpHelper(this._baseService, this._networkInfo);

  Future<T> _checkInternetBeforeHttpRequest<T>(
    Future<T> Function() performRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      return performRequest();
    } else {
      throw NoInternetException(AppErrorMessages.noInternet);
    }
  }

  // T _checkInternetBeforeOperation<T>(
  //   T Function() performRequest,
  // ) async {
  //   if (await _networkInfo.isConnected) {
  //     return performRequest();
  //   } else {
  //     throw NoInternetException(AppErrorMessages.noInternet);
  //   }
  // }

  List<GetSocket> get sockets => _baseService.sockets;

  GetHttpClient get httpClient => _baseService.httpClient;

  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {
    return _checkInternetBeforeHttpRequest<Response<T>>(
      () => _baseService.get<T>(
        url,
        headers: headers,
        contentType: contentType,
        query: query,
        decoder: decoder,
      ),
    );
  }

  Future<Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    return _checkInternetBeforeHttpRequest<Response<T>>(
      () => _baseService.post<T>(
        url,
        body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress,
      ),
    );
  }

  Future<Response<T>> put<T>(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    return _checkInternetBeforeHttpRequest<Response<T>>(
      () => _baseService.put<T>(
        url,
        body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress,
      ),
    );
  }

  Future<Response<T>> patch<T>(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    return _checkInternetBeforeHttpRequest<Response<T>>(
      () => _baseService.patch<T>(
        url,
        body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress,
      ),
    );
  }

  Future<Response<T>> request<T>(
    String url,
    String method, {
    dynamic body,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    return _checkInternetBeforeHttpRequest<Response<T>>(
      () => _baseService.request<T>(
        url,
        method,
        body: body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress,
      ),
    );
  }

  Future<Response<T>> delete<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {
    return _checkInternetBeforeHttpRequest<Response<T>>(
      () => _baseService.delete<T>(
        url,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
      ),
    );
  }

  GetSocket socket(
    String url, {
    Duration ping = const Duration(seconds: 5),
  }) {
    return _baseService.socket(
      url,
      ping: ping,
    );
  }

  /// query allow made GraphQL raw querys
  /// final connect = GetConnect();
  /// connect.baseUrl = 'https://countries.trevorblades.com/';
  /// final response = await connect.query(
  /// r"""
  /// {
  ///  country(code: "BR") {
  ///    name
  ///    native
  ///    currency
  ///    languages {
  ///      code
  ///      name
  ///    }
  ///  }
  ///}
  ///""",
  ///);
  ///print(response.body);
  Future<GraphQLResponse<T>> query<T>(
    String query, {
    String? url,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  }) {
    return _checkInternetBeforeHttpRequest<GraphQLResponse<T>>(
      () => _baseService.query(
        query,
        url: url,
        variables: variables,
        headers: headers,
      ),
    );
  }

  Future<GraphQLResponse<T>> mutation<T>(
    String mutation, {
    String? url,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  }) {
    return _checkInternetBeforeHttpRequest<GraphQLResponse<T>>(
      () => _baseService.query(
        mutation,
        url: url,
        variables: variables,
        headers: headers,
      ),
    );
  }

  bool get isDisposed => _baseService.isDisposed;

  void dispose() {
    _baseService.dispose();
  }
}
