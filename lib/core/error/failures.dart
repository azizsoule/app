import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
}

// General failures
class ServerFailure<T> extends Failure {
  final int? statusCode;
  final T? failureData;

  const ServerFailure(
      {this.statusCode, required String message, this.failureData})
      : super(message);

  @override
  List<Object> get props => [];
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class NoInternetFailure extends Failure {
  const NoInternetFailure(String message) : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UnknownFailure extends Failure {
  final Exception e;
  const UnknownFailure(String message, this.e) : super(message);

  @override
  List<Object?> get props => throw UnimplementedError();
}
