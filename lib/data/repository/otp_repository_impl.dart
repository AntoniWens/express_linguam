import 'package:dio/dio.dart';
import 'package:express_lingua/data/api/nusantara/otp_api.dart';
import 'package:express_lingua/data/datasources/otp/otp_api_data_source.dart';
import 'package:express_lingua/data/models/request/generate_otp_body.dart';
import 'package:express_lingua/data/models/request/send_information_body.dart';
import 'package:express_lingua/domain/repository/otp_repository.dart';




class OtpRepositoryImpl implements OtpRepository {
  final OtpApiDataSource otpApiDataSource;

  OtpRepositoryImpl(this.otpApiDataSource);

  @override
  Future<String> generateOTP(
      GenerateOtpBody body,
      ) async {
    try {
      final data = await otpApiDataSource.generateOTP(body);

      if (data.status == "1") {
        return data.data!;
      }

      return "";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> generateOTP2(
      GenerateOtpBody body,
      ) async {
    try {
      final data = await otpApiDataSource.generateOTP2(body);

      if (data.status == "1") {
        return data.data!;
      }

      return "";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> sendInformation(
      SendInformationBody body
      ) async {
    try {
      final data = await otpApiDataSource.sendInformation(body);

      if (data.status == "1") {
        return data.data!;
      }

      return "";
    } catch (e) {
      rethrow;
    }
  }
}
