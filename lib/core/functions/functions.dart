import 'package:app/core/error/exceptions.dart';
import 'package:app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

Future<Either<Failure, T>> performOperation<T>(
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
  } on ServerException catch (e) {
    return Left(
      ServerFailure(
        statusCode: e.statusCode,
        message: e.message,
        failureData: e.exceptionData,
      ),
    );
  }
}
