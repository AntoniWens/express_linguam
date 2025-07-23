abstract class LoginEvent {}

class LoggedIn extends LoginEvent {
  final String userId;
  final String password;

  LoggedIn(this.userId,this.password);
}
