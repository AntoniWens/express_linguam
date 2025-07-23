import 'package:express_lingua/data/models/request/register_body.dart';
import 'package:express_lingua/domain/usecase/user/user_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entity/entity.dart' as entity;
import '../../repository/user_repository.dart';

class UserUseCaseImpl extends UserUseCase {

  final UserRepository _userRepository;

  UserUseCaseImpl(this._userRepository);

  @override
  Future<entity.User> login(String userid, String password) => _userRepository.login(userid, password);

  @override
  Future<entity.User> register(RegisterBody body) => _userRepository.register(body);

  @override
  Future<UserCredential> signInWithGoogle() => _userRepository.signInWithGoogle();
}