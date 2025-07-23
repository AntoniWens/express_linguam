import 'package:express_lingua/data/db/user/user_data_user.dart';
import 'package:floor/floor.dart';

import '../base_dao.dart';



@dao
abstract class UserDao implements BaseDao<UserDataUser> {
  @Query("DELETE FROM user")
  @override
  Future<void> truncate();
}