// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/repositories/response_standard.dart';
import '../../shared/utils/preference_helper.dart';

class ServerException implements Exception {}

class ApiClient {
  final Dio dio = Dio();

  final baseUrl = dotenv.env['APP_ENV'] == 'dev' ? dotenv.env['API_BASE_URL_DEV'] : dotenv.env['API_BASE_URL_PROD'];
  static final isUseMockData = true;

  Future<Response> get(String pathUrl, {Map<String, dynamic>? params, String? path, bool isAuth = false}) async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    if (isAuth) {
      dio.options.headers['Authorization'] = "Bearer ${PreferenceHelper().getUserToken}";
    }
    dio.options.connectTimeout = 25000;
    dio.options.sendTimeout = 25000;
    dio.options.receiveTimeout = 25000;
    dio.interceptors.clear();
    dio.interceptors.add(CustomInterceptors(dio, baseUrl!, params: params));

    pathUrl = baseUrl! + pathUrl;

    var res = await dio.get(pathUrl + (path != null ? '/$path' : ''), queryParameters: params);

    return res;
  }

  Future<Response> post(String pathUrl, {var data, String? path, bool isAuth = false}) async {
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      if (isAuth) {
        dio.options.headers['Authorization'] = "Bearer ${PreferenceHelper().getUserToken}";
      }
      dio.options.connectTimeout = 25000;
      dio.options.sendTimeout = 25000;
      dio.options.receiveTimeout = 25000;
      dio.interceptors.clear();
      dio.interceptors.add(CustomInterceptors(dio, baseUrl!, data: data));

      pathUrl = baseUrl! + pathUrl;

      return data != null
          ? await dio.post(pathUrl + (path != null ? '/$path' : ''), data: data)
          : await dio.post(pathUrl + (path != null ? '/$path' : ''));
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> put(String pathUrl, {var data, String? path, bool isAuth = false}) async {
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      if (isAuth) {
        dio.options.headers['Authorization'] = "Bearer ${PreferenceHelper().getUserToken}";
      }
      dio.options.connectTimeout = 25000;
      dio.options.sendTimeout = 25000;
      dio.options.receiveTimeout = 25000;
      dio.interceptors.clear();
      dio.interceptors.add(CustomInterceptors(dio, baseUrl!, data: data));

      pathUrl = baseUrl! + pathUrl;

      return data != null
          ? await dio.put(pathUrl + (path != null ? '/$path' : ''), data: data)
          : await dio.post(pathUrl + (path != null ? '/$path' : ''));
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> delete(String pathUrl, {Map<String, dynamic>? params, String? path, bool isAuth = false}) async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    if (isAuth) {
      dio.options.headers['Authorization'] = "Bearer ${PreferenceHelper().getUserToken}";
    }
    dio.options.connectTimeout = 25000;
    dio.options.sendTimeout = 25000;
    dio.options.receiveTimeout = 25000;
    dio.interceptors.clear();
    dio.interceptors.add(CustomInterceptors(dio, baseUrl!, params: params));

    pathUrl = baseUrl! + pathUrl;

    var res = await dio.delete(pathUrl + (path != null ? '/$path' : ''), queryParameters: params);

    return res;
  }
}

class CustomInterceptors extends Interceptor {
  CustomInterceptors(this._dio, this.baseUrl, {this.params, this.data});

  final String baseUrl;
  final Dio _dio;
  final Map<String, dynamic>? params;
  final dynamic data;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print(
        'REQUEST[${options.method}: ${options.path}] => Param: ${options.queryParameters} => EXTRA: ${options.extra.toString()} => DATA: ${options.data} => Header: ${options.headers.toString()}');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}: ${response.requestOptions.path}] => DATA: ${response.data.toString()}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == null) {
      print('ERROR[${err.type.name}: ${err.requestOptions.path.toString()}] => MSG: ${err.message}');
      super.onError(
          DioError(
              error: 'Network Unavailable',
              response: Response(
                  requestOptions: err.requestOptions,
                  data: ResponseStandard(message: 'Network Unavailable, Please Try Again Later', status: 500).toJson(),
                  statusCode: 500),
              requestOptions: err.requestOptions),
          handler);
    } else {
      print('ERROR[${err.response?.statusCode}: ${err.requestOptions.path}] => DATA: ${err.response}');

      if (err.response?.statusCode == 502) {
        super.onError(
            DioError(
                error: 'Server Unavailable',
                response: Response(
                    requestOptions: err.requestOptions,
                    data: ResponseStandard(message: 'Server Unavailable, Please Try Again Later', status: 502).toJson(),
                    statusCode: 502),
                requestOptions: err.requestOptions),
            handler);
      } else {
        // }

        // var getRefreshToken = PreferenceHelper().getUserRefreshToken;

        // try {
        //   if (err.response!.statusCode == 401 &&
        //       err.response!.data['message'].toString().toLowerCase().contains('expired')) {
        //     var pathUrl = baseUrl + EndpointConstant.REFRESH_TOKEN;

        //     _dio.interceptors.requestLock.lock();
        //     _dio.interceptors.responseLock.lock();

        //     Dio tokenDio = new Dio();
        //     Dio newDio = new Dio();
        //     tokenDio.options.headers['content-Type'] = 'application/json';
        //     newDio.options.headers['content-Type'] = 'application/json';

        //     await tokenDio.get(pathUrl, queryParameters: {'refresh_token': getRefreshToken}).then((value) async {
        //       if (value.statusCode == 200) {
        //         // final user = UserModel.fromJson(jsonDecode(value.toString()), null);
        //         // final token = user.data.token;
        //         final user = 'TODO';
        //         final token = 'TODO';

        //         // PreferenceHelper().setUserToken(user.data.token);
        //         // PreferenceHelper().setUserRefreshToken(user.data.refreshToken);

        //         RequestOptions requestOptions = err.requestOptions;
        //         requestOptions.headers["Authorization"] = "Bearer $token";
        //         final options = Options(
        //           method: requestOptions.method,
        //           headers: requestOptions.headers,
        //         );
        //         var _resp =
        //             await newDio.request(requestOptions.path, queryParameters: params, options: options, data: data);
        //         print(
        //             'SUCCESS-REFRESH-TOKEN => PATH: ${err.requestOptions.path} => TOKEN: $token => CALL PATH: ${_resp.requestOptions.path} => DATA RESP: ${_resp.data}');

        //         handler.resolve(_resp);
        //       } else {
        //         print('FAILED-REFRESH-TOKEN => PATH: ${err.requestOptions.path} => ${value.toString()}');
        //         handler.reject(err);
        //       }
        //     }).whenComplete(() {
        //       _dio.interceptors.requestLock.unlock();
        //       _dio.interceptors.responseLock.unlock();
        //     });
        //   }
        // } catch (e) {
        //   handler.reject(err);
        //   print('ERROR-CATCH => PATH: ${err.requestOptions.path} => ${e.toString()}');
        // }
        // super.onError(err, handler);
      }
    }
  }
}
