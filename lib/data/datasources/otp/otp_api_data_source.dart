

import 'package:express_lingua/data/models/request/generate_otp_body.dart';
import 'package:express_lingua/data/models/request/send_information_body.dart';

import '../../common/wrapper.dart';

abstract class OtpApiDataSource {
  Future<Wrapper<String>> generateOTP(
      GenerateOtpBody body);

  Future<Wrapper<String>> generateOTP2(
      GenerateOtpBody body
      );

  Future<Wrapper<String>> sendInformation(
      SendInformationBody body
      );
}
