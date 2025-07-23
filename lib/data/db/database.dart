import 'dart:async';

import 'package:express_lingua/data/db/date_time_converter.dart';
import 'package:express_lingua/data/db/user/user_dao.dart';
import 'package:express_lingua/data/db/user/user_data_user.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 11, entities: [UserDataUser])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}