import 'package:express_lingua/domain/repository/base_repository.dart';
import 'package:express_lingua/data/datasources/base_disk_data_source.dart';
import 'package:express_lingua/domain/entity/entity.dart';

class BaseRepositoryImpl<E extends Entity> implements BaseRepository<E> {
  final BaseDiskDataSource<E> disk;

  BaseRepositoryImpl(this.disk);

  @override
  void insert(E item, void Function() complete) => disk.insert(item, complete);

  @override
  void truncate() => disk.truncate();


}