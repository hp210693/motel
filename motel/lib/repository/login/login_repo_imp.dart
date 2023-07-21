import 'dart:convert';
import 'dart:developer';

import 'package:motel/data/api/base_api_service.dart';
import 'package:motel/data/api/network_api_service.dart';
import 'package:motel/data/login/login.dart';
import 'package:motel/repository/login/login_repo.dart';

import '../../error_base/error_base.dart';

class LoginRepoImp extends LoginRepo {
  final BaseApiService _apiService = NetworkApiService();
  // Login user;
  @override
  Future<Login> getLoginInData(String userName, String passWord) async {
    log("go LoginRepoImp");

    /*  await _apiService.getLoginResponse(userName, passWord).then(
      (value) {
        log("LoginRepoImp data \n $value");
        Login user = Login.fromJson(jsonDecode(value));
        log("LoginRepoImp data \n $user");
      },
    ).onError(
      (error, stackTrace) {
        log("go LoginRepoImp error ${error}");
        throw Exception(error);
      },
    ); */

    try {
      final data = await _apiService.getLoginResponse(userName, passWord);
      log(data);
      Login user = Login.fromJson(jsonDecode(data));
      return user;
    } on ErrorBase catch (e) {
      //var error = ErrorBase();
      /*  if (e.statusCode == 101) {
        e.statusCode = 101;
        e.convertedData = false;
        throw Exception(e);
      } */
      log("go LoginRepoImp error ${e}");
      throw Exception(e);
      // rethrow;
    }
  }
}
