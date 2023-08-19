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
import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
part 'role.g.dart';

@JsonSerializable()
class Role {
  @JsonKey(name: 'role_id')
  final int roleId;

  @JsonKey(name: 'role_name')
  final String roleName;

  @JsonKey(name: 'grant_date')
  final String grantDate;

  /// Connect the generated [_$RoleFromJson] function to the `fromJson`
  /// factory.
  Role({required this.roleId, required this.roleName, required this.grantDate});

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  /// Connect the generated [_$RoleToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
