import 'dart:convert';
import 'dart:developer';
import 'package:motel/data/api/base_api_service.dart';
import 'package:motel/data/api/network_api_service.dart';
import 'package:motel/data/login/login.dart';
import 'package:motel/repository/login/login_repo.dart';

class LoginRepoImp extends LoginRepo {
  final BaseApiService _apiService = NetworkApiService();
  late Login _user;
  @override
  Future<Login> getLoginInData(String userName, String passWord) async {
    try {
      final data = await _apiService.getLoginResponse(userName, passWord);
      log("LoginRepoImp - getLoginInData\n $data");
      _user = Login.fromJson(jsonDecode(data));
      log("LoginRepoImp - convert data ok\n $_user");
      return _user;
    } catch (e) {
      rethrow;
    }
  }
}
