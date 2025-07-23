import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String generateUserID(String xUsername) {
  String uniqueID = generateShortUUID(length: 5);

  String lcHasilGetUser = xUsername.replaceAll(' ', '');
  if (lcHasilGetUser.length > 7) {
    lcHasilGetUser = lcHasilGetUser.substring(0, 7);
  }

  final now = DateTime.now();
  String mixerdatetime =
      '${now.year}'
      '${now.month.toString().padLeft(2, '0')}'
      '${now.day.toString().padLeft(2, '0')}'
      '${now.hour.toString().padLeft(2, '0')}'
      '${now.minute.toString().padLeft(2, '0')}'
      '${now.second.toString().padLeft(2, '0')}'
      '${now.millisecond.toString().padLeft(3, '0')}';

  lcHasilGetUser += mixerdatetime + uniqueID;

  return lcHasilGetUser;
}

String generatePassword(int n) {
  const characterSet =
      '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final random = Random.secure(); // pakai secure untuk keamanan
  final password = StringBuffer();

  for (var i = 0; i < n; i++) {
    final index = random.nextInt(characterSet.length);
    password.write(characterSet[index]);
  }
  return password.toString();
}

String generateShortUUID({int length = 5}) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final rand = Random.secure();

  return List.generate(length, (_) => chars[rand.nextInt(chars.length)]).join();
}

String handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return "Connection timeout. Please check your internet.";
    case DioExceptionType.sendTimeout:
      return "Send timeout. Try again later.";
    case DioExceptionType.receiveTimeout:
      return "Receive timeout. Please try again.";
    case DioExceptionType.badResponse:
      final response = error.response;
      if (response?.data is Map && response?.data['msg'] != null) {
        return response?.data['msg'];
      }
      return "Server error: ${response?.statusCode}";
    case DioExceptionType.cancel:
      return "Request was cancelled.";
    case DioExceptionType.unknown:
    default:
      return "Unexpected error occurred: ${error.message}";
  }
}

void showLoading(BuildContext context) {
  showDialog(context: context, builder: (context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text('Mohon tunggu sebentar...', style: TextStyle(
              fontSize: 12,
            ),)
          ],
        ),
      ),
    );
  });
}
