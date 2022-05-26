class BaseException implements Exception {
  final String message;

  BaseException(this.message);
}

class ServerException extends BaseException {
  final int? statusCode;
  final dynamic exceptionData;

  ServerException(
      {this.statusCode, this.exceptionData, required String message})
      : super(message);
}

class CacheException extends BaseException {
  CacheException(String message) : super(message);
}

class NoInternetException extends BaseException {
  NoInternetException(String message) : super(message);
}
