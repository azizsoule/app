import 'package:app/core/datasource/datasource.dart';
import 'package:app/features/feature_1/data/models/entity_model.dart';

abstract class IEntityLocalDatasource extends Datasource<EntityModel, void> {}

class EntityLocalDatasource implements IEntityLocalDatasource {
  @override
  Future<bool> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteById(void id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<List<EntityModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<EntityModel> getById(void id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<EntityModel> save(EntityModel object) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<EntityModel> update(EntityModel object) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
