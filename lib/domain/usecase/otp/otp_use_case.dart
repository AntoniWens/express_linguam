

import 'package:express_lingua/data/models/request/generate_otp_body.dart';
import 'package:express_lingua/data/models/request/send_information_body.dart';



abstract class OtpUseCase {
  Future<String> generateOTP(
      GenerateOtpBody body);

  Future<String> generateOTP2(
      GenerateOtpBody body
      );

  Future<String> sendInformation(
      SendInformationBody body
      );
}
