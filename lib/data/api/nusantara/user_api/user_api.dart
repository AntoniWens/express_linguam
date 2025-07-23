import 'package:dio/dio.dart';
import 'package:express_lingua/core/network/base_service.dart';
import 'package:express_lingua/data/models/request/register_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/wrapper.dart';

import 'package:express_lingua/data/api/nusantara/user_api/dto.dart' as dto;

class UserApi extends BaseService {

  Future<Wrapper<dto.User>> loginAsync(String email, String password) async {
    try {
      final response = await dio.post(
        '/user/login',
        data: {'userid': email, 'password': password},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (kDebugMode) {
        print('Login response: ${response.data}');
      }

      return Wrapper<dto.User>.fromJson(
        response.data,
            (json) => dto.User.fromJson(json as Map<String, dynamic> ),
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

  Future<Wrapper<dto.User>> registerAsync(RegisterBody body) async {
    print(body.toJson());
    try {
      final response = await dio.post(
        '/user/register',
        data: body.toJson(),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      if (kDebugMode) {
        print('Register response: ${response.statusCode}');
      }

      return Wrapper<dto.User>.fromJson(
        response.data,
            (json) => dto.User.fromJson(json as Map<String, dynamic> ),
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

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}