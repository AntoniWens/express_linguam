import 'package:dio/dio.dart';
import 'package:express_lingua/core/network/base_service.dart';
import 'package:express_lingua/data/models/request/generate_otp_body.dart';
import 'package:express_lingua/data/models/request/send_information_body.dart';
import 'package:flutter/foundation.dart';

import '../../common/wrapper.dart';

class OtpApi extends BaseService{
  Future<Wrapper<String>> sendInformation(SendInformationBody body) async {
    try {
      final response = await dio.post(
        '/sendinformation',
        data: body.toJson(),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (kDebugMode) {
        print('Send Information response: ${response.data}');
      }

      return Wrapper<String>.fromJson(
        response.data,
            (json) => json.toString(),
      );
    } on DioException catch (dioError) {
      if (kDebugMode) {
        print('Dio error: ${dioError.message}');
        print('Dio response: ${dioError.response?.data}');
      }
      rethrow;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Unknown error: $e');
        print('Stacktrace: $stacktrace');
      }

      throw Exception('Unexpected error occurred: $e');
    }
  }

  Future<Wrapper<String>> generateOTP(GenerateOtpBody body) async {
    try {
      final response = await dio.post(
        '/generateOTP2',
        data: body.toJson(),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (kDebugMode) {
        print('Generate Otp response: ${response.data}');
      }

      return Wrapper<String>.fromJson(
        response.data,
            (json) => json.toString(),
      );
    } on DioException catch (dioError) {
      if (kDebugMode) {
        print('Dio error: ${dioError.message}');
        print('Dio response: ${dioError.response?.data}');
      }
      rethrow;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Unknown error: $e');
        print('Stacktrace: $stacktrace');
      }

      throw Exception('Unexpected error occurred: $e');
    }
  }

  Future<Wrapper<String>> generateOTP2(GenerateOtpBody body) async {
    try {
      final response = await dio.post(
        '/generateOTP3',
        data: body.toJson(),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (kDebugMode) {
        print('Generate otp 2 response: ${response.data}');
      }

      return Wrapper<String>.fromJson(
        response.data,
            (json) => json.toString(),
      );
    } on DioException catch (dioError) {
      if (kDebugMode) {
        print('Dio error: ${dioError.message}');
        print('Dio response: ${dioError.response?.data}');
      }
      rethrow;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Unknown error: $e');
        print('Stacktrace: $stacktrace');
      }

      throw Exception('Unexpected error occurred: $e');
    }
  }
}