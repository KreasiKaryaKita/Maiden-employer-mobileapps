import 'package:maiden_employer/app/config/constants/endpoint_constant.dart';
import 'package:maiden_employer/app/data/networking/api_client.dart';
import 'package:maiden_employer/app/models/response_login.dart';
import 'package:maiden_employer/app/models/response_standard.dart';

class ApiRepositories {
  static Future<ResponseModel?> login({required String username, required String password}) async {
    var data = {
      'username': username,
      'password': password,
    };
    var response = await ApiClient().service(
      pathUrl: EndpointConstant.LOGIN,
      method: REQUEST_METHOD.POST,
      data: data,
      isAuth: false,
    );

    if (response.statusCode == 200) {
      return ResponseLogin.fromJson(response.data);
    } else {
      return ResponseStandard.fromJson(response.data);
    }
  }
}
