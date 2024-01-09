import 'package:flutter_mvvm/data/network/network_api_services.dart';
import 'package:flutter_mvvm/resourses/app_urls.dart';
import 'package:flutter_mvvm/utils/utils.dart';

import '../../../data/network/base_api_services.dart';
import '../../../data/response/parser.dart';

class AuthRepository {

  final BaseApiServices _apiServices = NetworkApiService();


  Future<dynamic> login(dynamic data) async {
    return await _apiServices.callPostApi(
        AppUrl.loginEndPoint, {}, Parser.parseLoginResponse,
        body: data);
  }

  Future<dynamic> registerApi(dynamic data) async {
    return await _apiServices.callPostApi(
        AppUrl.registerApiEndPoint, {}, Parser.parseLoginResponse,
        body: data);
  }
}
