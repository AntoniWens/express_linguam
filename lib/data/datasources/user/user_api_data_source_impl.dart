import 'package:express_lingua/data/datasources/user/user_api_data_source.dart';
import 'package:express_lingua/data/mapper/dto_to_entity_extension.dart';
import 'package:express_lingua/data/models/request/register_body.dart';

import 'package:express_lingua/data/common/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entity/entity.dart' as entity;
import '../../api/nusantara/user_api/user_api.dart';

class UserApiDataSourceImpl extends UserApiDataSource {

  final UserApi _userApi;

  UserApiDataSourceImpl(this._userApi);

  @override
  Future<Wrapper<entity.User>> login(String userid, String password) async {

    try {
      final user = await _userApi.loginAsync(userid, password);
      return Wrapper(status: user.status, message: user.message, data: user.data?.toEntity());
    } catch(e) {
      rethrow;
    }
  }

  @override
  Future<Wrapper<entity.User>> register(RegisterBody body) async {
    try {
      final user = await _userApi.registerAsync(body);
      return Wrapper(status: user.status, message: user.message, data: user.data?.toEntity());
    } catch(e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential?> signInWithGoogle() => _userApi.signInWithGoogle();

}