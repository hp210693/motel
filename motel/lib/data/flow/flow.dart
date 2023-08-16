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
part 'flow.g.dart';

@JsonSerializable()
class Flow {
  @JsonKey(name: 'flow_id')
  final int flowId;

  @JsonKey(name: 'flow_name')
  final String flowName;

  /// Connect the generated [_$FlowFromJson] function to the `fromJson`
  /// factory.
  Flow({
    required this.flowId,
    required this.flowName,
  });

  factory Flow.fromJson(Map<String, dynamic> json) => _$FlowFromJson(json);

  /// Connect the generated [_$FlowToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FlowToJson(this);
}
