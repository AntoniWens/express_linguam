import 'package:express_lingua/domain/entity/entity.dart' as entity;

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final entity.User user;

  LoginLoaded(this.user);
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
