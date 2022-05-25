import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class Repository<T extends Equatable, ID> {
  // Create
  Future<Either<Failure, T>> save(T object);

  // Read
  //Future<T> get(T object);
  Future<Either<Failure, T>> getById(ID id);
  Future<Either<Failure, List<T>>> getAll();

  // Update
  Future<Either<Failure, T>> update(T object);

  // Delete
  //Future<bool> delete(T id);
  Future<Either<Failure, bool>> deleteById(ID id);
  Future<Either<Failure, bool>> deleteAll();
}
