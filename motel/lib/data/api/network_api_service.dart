import 'dart:developer';
import 'package:http/http.dart';
import 'package:motel/data/api/api_endpoints.dart';
import 'package:motel/data/api/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  late Response _resp;
  late String _url;
  static const int _timeOut = 35;
  @override
  Future<dynamic> getLoginResponse(String userName, String passWord) async {
    try {
      _url = ApiEndPoints().loginUrl(userName, passWord);
      log("NetworkApiService - getLoginResponse - url = $_url");
      _resp = await http
          .get(Uri.parse(_url))
          .timeout(const Duration(seconds: _timeOut));

      if (_resp.statusCode == 200) return _resp.body;
    } catch (e) {
      rethrow;
    }
  }
}
