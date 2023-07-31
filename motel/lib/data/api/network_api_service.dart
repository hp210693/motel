/*MIT License

Copyright (c) 2023 Hung Phan (@hp210693)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.*/
import 'dart:developer';
import 'package:motel/data/api/api_endpoints.dart';
import 'package:motel/data/api/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  static const int _timeOut = 30;
  @override
  Future<dynamic> getLoginResponse(String userName, String passWord) async {
    try {
      final url = ApiEndPoints().loginUrl(userName, passWord);
      log("NetworkApiService - getLoginResponse - url = $url");
      final resp = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: _timeOut));

      log("NetworkApiService - getLoginResponse - url = $resp");

      if (resp.statusCode == 200) {
        return resp.body;
      } else {
        return Exception("error");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> getHomeResponse(String _) async {
    try {
      final url = ApiEndPoints().roomsUrl();
      log("NetworkApiService - getLoginResponse - url = $url");
      final resp = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: _timeOut));

      if (resp.statusCode == 200) return resp.body;
    } catch (e) {
      rethrow;
    }
  }
}
