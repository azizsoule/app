import 'package:app/core/datasource/datasource.dart';
import 'package:app/features/post/data/models/post_model.dart';
import 'package:get_storage/get_storage.dart';

abstract class IPostLocalDatasource extends Datasource<PostModel, int> {}

class PostLocalDatasource implements IPostLocalDatasource {
  final GetStorage _box;

  PostLocalDatasource(this._box);

  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteById(int id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<PostModel> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<PostModel> save(PostModel object) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<PostModel> update(PostModel object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
