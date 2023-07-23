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
