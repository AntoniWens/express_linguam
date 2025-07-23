

import 'package:express_lingua/data/datasources/user/user_disk_data_source.dart';
import 'package:express_lingua/data/mapper/entity_to_data_extension.dart';
import '../../../domain/entity/entity.dart' as entity;
import '../../db/user/user_dao.dart';
class UserDiskDataSourceImpl implements UserDiskDataSource {
  final UserDao dao;

  UserDiskDataSourceImpl(this.dao);

  @override
  void insert(entity.User item, void Function() complete) {
    Future(() async {
      await dao.insert(item.toUserData());
      complete();
    });
  }

  @override
  void truncate() => dao.truncate();
}
