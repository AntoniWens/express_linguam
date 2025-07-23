
import 'package:floor/floor.dart';

abstract class BaseDao<T> {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insert(T item);

  Future<void> truncate();
}