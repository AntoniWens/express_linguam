import 'package:express_lingua/core/network/base_use_case.dart';
import 'package:express_lingua/data/models/request/register_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entity/entity.dart' as entity;

abstract class UserUseCase extends BaseUseCase {
  Future<entity.User> login(String userid, String password);
  Future<entity.User> register(RegisterBody body);
  Future<UserCredential> signInWithGoogle();
}