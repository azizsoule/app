abstract class Repository<T, ID> {
    // Create
    Future<T> create(T object);

    // Read
    Future<T> getOne(ID id);
    Future<List<T>> getAll();

    // Update
    Future<T> update(T object);

    // Delete
    Future<bool> deleteOne(ID id);
    Future<bool> deleteAll();
}