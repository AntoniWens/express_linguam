
import 'package:express_lingua/data/models/request/register_body.dart';

import 'package:express_lingua/data/common/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entity/entity.dart' as entity;
import '../base_data_source.dart';

abstract class UserApiDataSource extends BaseDataSource{
  Future<Wrapper<entity.User>> login(String userid, String password);
  Future<Wrapper<entity.User>> register(RegisterBody body);
  Future<UserCredential?> signInWithGoogle();
}