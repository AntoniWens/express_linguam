import 'package:dio/dio.dart';
import 'package:express_lingua/data/api/nusantara/otp_api.dart';
import 'package:express_lingua/data/models/request/generate_otp_body.dart';
import 'package:express_lingua/data/models/request/send_information_body.dart';

import '../../common/wrapper.dart';
import 'otp_api_data_source.dart';


class OtpApiDataSourceImpl implements OtpApiDataSource {
  final OtpApi api;

  OtpApiDataSourceImpl(this.api);

  @override
  Future<Wrapper<String>> generateOTP(
      GenerateOtpBody body,
      ) async {
    try {
      final data = await api.generateOTP(body);

      return Wrapper(status: data.status,message: data.message,data:data.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Wrapper<String>> generateOTP2(
      GenerateOtpBody body,
      ) async {
    try {
      final data = await api.generateOTP2(body);

      return Wrapper(status: data.status,message: data.message,data:data.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Wrapper<String>> sendInformation(
      SendInformationBody body
      ) async {
    try {
      final data = await api.sendInformation(body);

      return Wrapper(status: data.status,message: data.message,data:data.data);
    } catch (e) {
      rethrow;
    }
  }
}
