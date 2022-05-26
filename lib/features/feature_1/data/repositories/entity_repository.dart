import 'package:app/core/error/exceptions.dart';
import 'package:app/core/functions/functions.dart';
import 'package:app/features/feature_1/data/datasources/entity_local_datasource.dart';
import 'package:app/features/feature_1/data/datasources/entity_remote_datasource.dart';
import 'package:app/features/feature_1/domain/entities/entity.dart';
import 'package:app/core/error/failures.dart';
import 'package:app/features/feature_1/domain/repositories/entity_repository_interface.dart';
import 'package:dartz/dartz.dart';

class EntityRepository implements IEntityRepository {
  final IEntityLocalDatasource _localDatasource;
  final IEntityRemoteDatasource _remoteDatasource;

  EntityRepository(this._localDatasource, this._remoteDatasource);

  @override
  Future<Either<Failure, bool>> deleteAll([bool remote = true]) async {
    return await performOperation(() async {
      return true;
    });
  }

  @override
  Future<Either<Failure, bool>> deleteById(void id, [bool remote = true]) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Entity>>> getAll([bool remote = true]) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Entity>> getById(void id, [bool remote = true]) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Entity>> save(Entity object, [bool remote = true]) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Entity>> update(Entity object, [bool remote = true]) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
