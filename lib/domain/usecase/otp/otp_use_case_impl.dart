import 'package:dio/dio.dart';
import 'package:express_lingua/data/api/nusantara/otp_api.dart';
import 'package:express_lingua/data/datasources/otp/otp_api_data_source.dart';
import 'package:express_lingua/data/models/request/generate_otp_body.dart';
import 'package:express_lingua/data/models/request/send_information_body.dart';
import 'package:express_lingua/domain/repository/otp_repository.dart';
import 'package:express_lingua/domain/usecase/otp/otp_use_case.dart';




class OtpUseCaseImpl implements OtpUseCase {
  final OtpRepository otpRepository;

  OtpUseCaseImpl(this.otpRepository);

  @override
  Future<String> generateOTP(
      GenerateOtpBody body,
      ) => otpRepository.generateOTP(body);

  @override
  Future<String> generateOTP2(
      GenerateOtpBody body,
      )=> otpRepository.generateOTP2(body);

  @override
  Future<String> sendInformation(
      SendInformationBody body
      ) => otpRepository.sendInformation(body);

}
