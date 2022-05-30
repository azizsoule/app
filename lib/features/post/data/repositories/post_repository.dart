import 'package:app/core/error/failures.dart';
import 'package:app/core/functions/functions.dart';
import 'package:app/features/post/data/datasources/post_local_datasource.dart';
import 'package:app/features/post/data/datasources/post_remote_datasource.dart';
import 'package:app/features/post/domain/entities/post.dart';
import 'package:app/features/post/domain/repositories/post_repository_interface.dart';
import 'package:dartz/dartz.dart';

class PostRepository implements IPostRepository {
  final IPostLocalDatasource _localDatasource;
  final IPostRemoteDatasource _remoteDatasource;

  PostRepository(this._localDatasource, this._remoteDatasource);

  @override
  Future<Either<Failure, bool>> deleteAll([bool remote = true]) {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteById(int id, [bool remote = true]) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Post>>> getAll([bool remote = true]) async {
    return await performEitherRequest(
      () async {
        return await _remoteDatasource.getAll();
      },
    );
  }

  @override
  Future<Either<Failure, Post>> getById(int id, [bool remote = true]) async {
    return await performEitherRequest(
      () async {
        return await _remoteDatasource.getById(id);
      },
    );
  }

  @override
  Future<Either<Failure, Post>> save(Post object, [bool remote = true]) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Post>> update(Post object, [bool remote = true]) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
