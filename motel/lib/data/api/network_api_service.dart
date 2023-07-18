import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:motel/data/api/api_endpoints.dart';
import 'package:motel/data/api/base_api_service.dart';
import 'package:motel/data/login/login.dart';

class NetworkApiService extends BaseApiService {
  final dio = Dio();
  @override
  Future<dynamic> getLoginResponse(String userName, String passWord) async {
    try {
      String url = ApiEndPoints().loginUrl(userName, passWord);
      final response = await dio.get(url);
      print("go NetworkApiService url = $url");
      if (response.statusCode == 200) {
        return response;
        //return Login.fromJson(jsonDecode(response.data));
      }
    } catch (e) {
      rethrow;
    }
  }
}
