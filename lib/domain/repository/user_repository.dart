import 'package:express_lingua/domain/repository/base_repository.dart';
import 'package:express_lingua/data/models/request/register_body.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../data/common/wrapper.dart';
import '../../../domain/entity/entity.dart' as entity;

abstract class UserRepository implements BaseRepository<entity.User> {
  Future<entity.User> login(String userid, String password);
  Future<entity.User> register(RegisterBody body);
  Future<UserCredential> signInWithGoogle();
}