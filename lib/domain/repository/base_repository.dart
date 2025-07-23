abstract class BaseRepository<T> {

  void insert(T item, void Function() complete);
  /// Truncate all data
  void truncate();
}