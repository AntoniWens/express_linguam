import 'package:express_lingua/data/datasources/base_data_source.dart';

abstract class BaseDiskDataSource<T> extends BaseDataSource{

  /// Add record.
  void insert(T item, void Function() complete);

  /// Truncate table.
  void truncate();
}
