import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../utils/environment.dart';

abstract class BaseService {
  final Dio dio;

  BaseService()
      : dio = Dio(BaseOptions(baseUrl: '${Environment.baseUrl}api')) {
    if (kDebugMode) {
      dio.options.headers['User-Agent'] = 'Express_Lingua';
      dio.interceptors.add(LogInterceptor(responseBody: true));
    }
  }
}