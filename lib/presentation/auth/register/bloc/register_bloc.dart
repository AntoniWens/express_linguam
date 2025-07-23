import 'package:express_lingua/domain/usecase/otp/otp_use_case.dart';
import 'package:express_lingua/presentation/auth/register/bloc/register_event.dart';
import 'package:express_lingua/presentation/auth/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecase/user/user_use_case.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserUseCase userUseCase;
  final OtpUseCase otpUseCase;

  RegisterBloc(this.userUseCase, this.otpUseCase) : super(RegisterInitial()) {
    on<GenerateOTP>((event, emit) async {
      emit(GenerateOTPInitial());
      try {
        emit(RegisterLoading());
        final otp = await otpUseCase.generateOTP(event.body);
        emit(GenerateOTPLoaded(otp, "Resend OTP"));
      } catch (e) {
        emit(RegisterError(e.toString()));
      }
    });

    on<RegisterUser>((event, emit) async {
      emit(RegisterInitial());
      if (event.inputOtp.isNotEmpty) {
        if (event.inputOtp == event.requestOtp) {
          try {
            emit(RegisterLoading());
            final user = await userUseCase.register(event.body);
            if (event.body.nohpReferral.isNotEmpty) {
              await otpUseCase.sendInformation(event.sendInformationBody);
            }
            emit(RegisterLoaded(user));
          } catch (e) {
            emit(RegisterError(e.toString()));
          }
        } else {
          emit(RegisterError("OTP tidak valid"));
        }
      } else {
        emit(RegisterError("Masukan OTP"));
      }

    });

    on<GoogleLogged>((event, emit) async {
      emit(RegisterInitial());
      if (event.checked) {
        try {
          final user = await userUseCase.signInWithGoogle();
          emit(OpenRegisterForm(user));
        } catch (e) {
          emit(RegisterError(e.toString()));
        }
      } else {
        emit(RegisterChecked());
      }
    });

    on<ORegisterForm>((event, emit) async {
      if (event.checked) {
        emit(OpenRegisterForm(null));
      }else {
        emit(RegisterChecked());
      }
    });

  }
}