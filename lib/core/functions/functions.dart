import 'package:app/core/error/exceptions.dart';
import 'package:app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

Future<Either<Failure, T>> performEitherRequest<T, E>(
    Future<T> Function() operation) async {
  try {
    final T result = await operation();
    return Right(result);
  } on CacheException catch (e) {
    return Left(
      CacheFailure(e.message),
    );
  } on NoInternetException catch (e) {
    return Left(
      NoInternetFailure(e.message),
    );
  } on ServerException<E> catch (e) {
    return Left(
      ServerFailure<E>(
        statusCode: e.statusCode,
        message: e.message,
        failureData: e.exceptionData,
      ),
    );
  } on Exception catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return Left(
      UnknownFailure(e.toString(), e),
    );
  }
}
