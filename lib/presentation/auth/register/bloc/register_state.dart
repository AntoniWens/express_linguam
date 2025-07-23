import 'package:express_lingua/domain/entity/entity.dart' as entity;
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}


class RegisterLoading extends RegisterState {}
class RegisterForm extends RegisterState {
  final String email;
  final String name;

  RegisterForm(this.email, this.name);
}
class RegisterOTP extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final entity.User user;

  RegisterLoaded(this.user);
}

class OpenRegisterForm extends RegisterState {
  final UserCredential? user;

  OpenRegisterForm(this.user);
}
class GenerateOTPInitial extends RegisterState {}
class GenerateOTPLoaded extends RegisterState {
  final String otp;
  final String buttonText;

  GenerateOTPLoaded(this.otp, this.buttonText);
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError(this.message);
}

class RegisterChecked extends RegisterState {
  RegisterChecked();
}
