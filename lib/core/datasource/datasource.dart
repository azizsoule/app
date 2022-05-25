import 'package:equatable/equatable.dart';

abstract class Datasource<T extends Equatable, ID> {
  // Create
  Future<T> save(T object);

  // Read
  //Future<T> get(T object);
  Future<T> getById(ID id);
  Future<List<T>> getAll();

  // Update
  Future<T> update(T object);

  // Delete
  //Future<bool> delete(T id);
  Future<bool> deleteById(ID id);
  Future<bool> deleteAll();
}
