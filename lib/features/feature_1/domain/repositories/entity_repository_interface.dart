import 'package:app/core/error/failures.dart';
import 'package:app/core/repository/repository.dart';
import 'package:app/features/feature_1/domain/entities/entity.dart';
import 'package:dartz/dartz.dart';

class IEntityRepository extends Repository<Entity, void> {
  @override
  Future<Either<Failure, bool>> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteById(void id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Entity>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Entity>> getById(void id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Entity>> save(Entity object) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Entity>> update(Entity object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}