import 'package:express_lingua/domain/usecase/user/user_use_case.dart';
import 'package:express_lingua/presentation/auth/login/bloc/login_event.dart';
import 'package:express_lingua/presentation/auth/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserUseCase userUseCase;

  LoginBloc(this.userUseCase) : super(LoginInitial()) {
    on<LoggedIn>((event, emit) async {
      emit(LoginInitial());
      try {
        emit(LoginLoading());
        final user = await userUseCase.login(event.userId, event.password);
        emit(LoginLoaded(user));
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });
  }
}
