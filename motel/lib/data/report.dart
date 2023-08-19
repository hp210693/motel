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
part 'report.g.dart';

@JsonSerializable()
class Report {
  @JsonKey(name: 'bill_id')
  final int billId;

  @JsonKey(name: 'room_id')
  final int roomId;

  @JsonKey(name: 'created_date')
  final DateTime createdDate;

  @JsonKey(name: 'total_payment')
  final double totalPayment;

  @JsonKey(name: 'img_total_payment')
  final String imgTotalPayment;

  @JsonKey(name: 'note')
  final String note;

  /// Connect the generated [_$ReportFromJson] function to the `fromJson`
  /// factory.
  Report(
      {required this.createdDate,
      required this.billId,
      required this.roomId,
      required this.totalPayment,
      required this.imgTotalPayment,
      required this.note});
  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  /// Connect the generated [_$ReportToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
