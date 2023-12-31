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
import 'dart:convert';
import 'dart:developer';
import 'package:motel/api/base_api_service.dart';
import 'package:motel/api/network_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> getLoginInData(String userName, String passWord) async {
    try {
      final data = await _apiService.getLoginResponse(userName, passWord);
      log("LoginRepoImp - getLoginInData\n $data");
      //final user = Login.fromJson(jsonDecode(data));
      final Map user = json.decode(data);
 
      final prefs = await SharedPreferences.getInstance();
      // Remove the counter key-value pair from persistent storage.
      await prefs.remove("access_token");
      await prefs.remove("user_id");
      await prefs.remove("role");
      await prefs.remove("user_name");
      await prefs.remove("issued_at");
      await prefs.remove("expired");

      // Save the counter value to persistent storage under the 'counter' key.
      await prefs.setString("access_token", user["access_token"]);
      await prefs.setString("user_id", user["user_id"]);
      await prefs.setString("role", user["role"]);
      await prefs.setString("user_name", user["user_name"]);
      await prefs.setString("issued_at", user["issued_at"]);
      await prefs.setString("expired", user["expired"]);
      return "OK";
    } catch (e) {
      rethrow;
    }
  }
}
