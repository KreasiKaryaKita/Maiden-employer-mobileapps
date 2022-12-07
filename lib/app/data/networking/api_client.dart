// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names, camel_case_types

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:maiden_employer/app/config/constants/preference_constant.dart';
import 'package:maiden_employer/app/models/response_standard.dart';
import 'package:maiden_employer/app/routes/app_pages.dart';
import 'package:maiden_employer/app/shared/utils/preference_helper.dart';
import 'package:get/get.dart' as pref_get;

/// *** API SERVICE CLIENT
enum REQUEST_METHOD { POST, GET }

class ApiClient {
  final Dio dio = Dio();

  final baseUrl = dotenv.env['APP_ENV'] == 'dev' ? dotenv.env['API_BASE_URL_DEV'] : dotenv.env['API_BASE_URL_PROD'];

  Future<void> initialize(isAuth, params, data) async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    if (isAuth) {
      var token = await PreferenceHelper().get(
        key: PreferenceConstant.USER_TOKEN,
      );
      dio.options.headers['Authorization'] = "Bearer $token";
    }
    dio.options.connectTimeout = 25000;
    dio.options.sendTimeout = 25000;
    dio.options.receiveTimeout = 25000;
    dio.interceptors.clear();
    dio.interceptors.add(CustomInterceptors(dio, baseUrl!, isAuth, params: params, data: data));
  }

  Future<Response> service({
    required String pathUrl,
    required REQUEST_METHOD method,
    bool isAuth = true,
    Map<String, dynamic>? params,
    var data,
  }) async {
    try {
      await initialize(isAuth, params, data);
      pathUrl = baseUrl! + pathUrl;
      if (method == REQUEST_METHOD.GET) {
        return await dio.get(pathUrl, queryParameters: params);
      }
      return await dio.post(pathUrl, data: data);
    } on DioError catch (e) {
      return e.response!;
    }
  }
}

class CustomInterceptors extends Interceptor {
  CustomInterceptors(this.dio, this.baseUrl, this.isAuth, {this.params, this.data});

  final String baseUrl;
  final Dio dio;
  final Map<String, dynamic>? params;
  final data;
  final bool isAuth;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      log(
        'REQUEST[${options.method}: ${options.path}] => Param: ${options.queryParameters} => EXTRA: ${options.extra.toString()} => DATA: ${options.data} => Header: ${options.headers.toString()}',
      );
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log(
        'RESPONSE[${response.statusCode}: ${response.requestOptions.path}] => DATA: ${response.data.toString()}',
      );
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == null) {
      if (kDebugMode) {
        log('ERROR[${err.type.name}: ${err.requestOptions.path.toString()}] => MSG: ${err.message}');
      }
      super.onError(
        DioError(
          error: 'error_server'.tr,
          response: Response(
            requestOptions: err.requestOptions,
            data: ResponseStandard(
              data: {},
              error: 500,
            ).toJson(),
            statusCode: 500,
          ),
          requestOptions: err.requestOptions,
        ),
        handler,
      );
    } else if (err.response?.statusCode == 401) {
      if (kDebugMode) {
        log('ERROR[${err.response?.statusCode}: ${err.requestOptions.path}] => DATA: ${err.response}');
      }
      super.onError(err, handler);
      if (isAuth) {
        PreferenceHelper().deleteAll();
        pref_get.Get.offAllNamed(Routes.SPLASH);
      }
    } else {
      if (kDebugMode) {
        log('ERROR[${err.response?.statusCode}: ${err.requestOptions.path}] => DATA: ${err.response}');
      }
      super.onError(err, handler);
    }
  }
}
