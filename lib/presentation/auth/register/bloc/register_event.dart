import 'package:express_lingua/data/models/request/generate_otp_body.dart';
import 'package:express_lingua/data/models/request/register_body.dart';
import 'package:express_lingua/data/models/request/send_information_body.dart';

abstract class RegisterEvent {}

class RegisterUser extends RegisterEvent {
  final RegisterBody body;
  final SendInformationBody sendInformationBody;
  final String requestOtp;
  final String inputOtp;

  RegisterUser(this.body, this.sendInformationBody, this.inputOtp, this.requestOtp);
}

class GenerateOTP extends RegisterEvent {
  final GenerateOtpBody body;

  GenerateOTP(this.body);
}

class GoogleLogged extends RegisterEvent {
  final bool checked;
  GoogleLogged(this.checked);
}

class ORegisterForm extends RegisterEvent {
  final bool checked;
  ORegisterForm(this.checked);
}
