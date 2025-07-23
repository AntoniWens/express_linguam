
import 'package:express_lingua/data/datasources/user/user_api_data_source.dart';
import 'package:express_lingua/data/models/request/register_body.dart';
import 'package:express_lingua/domain/repository/user_repository.dart';
import 'package:express_lingua/data/common/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entity/entity.dart' as entity;
import '../datasources/user/user_disk_data_source.dart';
import 'base_repository_impl.dart';


class UserRepositoryImpl extends BaseRepositoryImpl<entity.User> implements UserRepository {
  final UserApiDataSource apiSource;
  final UserDiskDataSource diskSource;

  UserRepositoryImpl({
    required this.apiSource,
    required this.diskSource,
  }) : super(diskSource);

  @override
  Future<entity.User> login(String userid, String password) async{

    try {
      final user = await apiSource.login(userid, password);
      if (user.status == "1") {
        truncate();
        //user.data?.active = true;
        insert(user.data!, () {});
        return user.data!;
      }
      throw Exception(user.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<entity.User> register(RegisterBody body) async{
    try {
      final user = await apiSource.register(body);
      print(user.status);
      if (user.status == "1") {
        return user.data!;
      }
      throw Exception(user.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final user = await apiSource.signInWithGoogle();
    if (user != null) {
      return user;
    } else {
      throw Exception('Google sign-in failed');
    }
  }

}