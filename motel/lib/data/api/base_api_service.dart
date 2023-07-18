abstract class BaseApiService {
  /*  final String _baseUrl;
  final String _userName;
  final String _passWord; */
  Future<dynamic> getLoginResponse(String userName, String passWord);
}
