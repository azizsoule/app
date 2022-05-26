import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

abstract class Repository<T extends Equatable, ID> {
  // Create
  Future<Either<Failure, T>> save(T object, [bool remote = true]);

  // Read
  //Future<T> get(T object);
  Future<Either<Failure, T>> getById(ID id, [bool remote = true]);
  Future<Either<Failure, List<T>>> getAll([bool remote = true]);

  // Update
  Future<Either<Failure, T>> update(T object, [bool remote = true]);

  // Delete
  //Future<bool> delete(T id);
  Future<Either<Failure, bool>> deleteById(ID id, [bool remote = true]);
  Future<Either<Failure, bool>> deleteAll([bool remote = true]);
}
