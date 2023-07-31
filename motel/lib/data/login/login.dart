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
import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';

@JsonSerializable()
class Login {
  @JsonKey(defaultValue: '')
  final String statusCode;

  @JsonKey(defaultValue: '')
  final String message;

  @JsonKey(name: 'account_id')
  final int accountId;

  @JsonKey(name: 'room_id')
  final int roomId;

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'password')
  final String passWord;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'created_on')
  final DateTime createdOn;

  @JsonKey(name: 'last_login')
  final DateTime lastLogin;

  /// Connect the generated [_$LoginFromJson] function to the `fromJson`
  /// factory.
  Login(
      {required this.statusCode,
      required this.message,
      required this.accountId,
      required this.roomId,
      required this.userName,
      required this.passWord,
      required this.email,
      required this.createdOn,
      required this.lastLogin});
  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  /// Connect the generated [_$LoginToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
