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
import 'package:motel/data/api/base_api_service.dart';
import 'package:motel/data/api/network_api_service.dart';
import 'package:motel/data/login.dart';

class SignUpRepo {
  final BaseApiService _apiService = NetworkApiService();
  Future<String> postSignUpNewAccountData(
      String userName, String phone, String cid, String password) async {
    try {
      final json = Login(
        statusCode: "",
        message: "",
        accountId: 0,
        roomId: 1,
        roleId: 4,
        userName: userName,
        cid: cid,
        driverLicense: "",
        phone: phone,
        passWord: password,
        email: "",
      ).toJson();

      final data = await _apiService.postSignUpNewAccount(json);
      log("LoginRepoImp - getLoginInData\n $data");
      //final user = Login.fromJson(jsonDecode(data));
      final user = jsonDecode(data);
      log("LoginRepoImp - convert data ok\n $user");
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
