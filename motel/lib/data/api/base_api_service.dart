abstract class BaseApiService {
  Future<dynamic> getLoginResponse(String userName, String passWord);
  Future<dynamic> getHomeResponse(String _);
}
