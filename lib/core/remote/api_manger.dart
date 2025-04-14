import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManger {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      validateStatus: (status) {
        if (status == 409 || status! >= 200 && status < 300|| status == 401) {
          return true;
        } else {
          return false;
        }
      },
    ),
  )..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ));

  Future<Response> getRequest(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) {
    return dio.get(path,
        queryParameters: queryParameters, options: Options(headers: headers));
  }

  Future<Response> postRequest(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    return dio.post(path, data: body, options: Options(headers: headers));
  }

  Future<Response> postRequestFormData(
      {required String path,
      required Map<String, dynamic> data,
      Map<String, dynamic>? headers}) {
    return dio.post(path,
        data: FormData.fromMap(data), options: Options(headers: headers));
  }
}
