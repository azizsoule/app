import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
}

// General failures
class ServerFailure extends Failure {
  final int? statusCode;
  final dynamic failureData;

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
