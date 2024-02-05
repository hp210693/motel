/*MIT License

Copyright (c) 2024 Hung Phan (@hp210693)

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
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:motel/api/api_endpoints.dart';
import 'package:motel/api/api_service.dart';

class NetworkService extends ApiService {
  static final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 45),
  ));

  @override
  Future<dynamic> forgotPassResponse(Object data) async {
    try {
      final url = ApiEndPoints().forgotPassUrl();
      final response =
          await dio.request(url, data: data, options: Options(method: "POST"));
      log("NetworkApiService - forgotPassResponse - url =");
      if (response.statusCode == 200) {
        return jsonEncode(response.data);
      } else {
        return Exception("error");
      }
    } catch (e) {
      rethrow;
    }
  }
}
