import 'package:motel/data/api/base_api_service.dart';
import 'package:motel/data/api/network_api_service.dart';
import 'package:motel/repository/login/login_repo.dart';

class LoginRepoImp extends LoginRepo {
  final BaseApiService _apiService = NetworkApiService();
  @override
  Future<dynamic> getLoginInData(String userName, String passWord) async {
    print("go LoginRepoImp");
    try {
      dynamic respone = await _apiService.getLoginResponse(userName, passWord);
      return respone;
    } catch (e) {
      rethrow;
    }
  }
}
