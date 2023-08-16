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
part 'room.g.dart';

@JsonSerializable()
class Room {
  @JsonKey(name: 'room_id')
  final int roomId;
  @JsonKey(name: 'flow_id')
  final int flowId;
  @JsonKey(name: 'area')
  final String area;
  @JsonKey(name: 'status_room')
  final int statusRoom;
  @JsonKey(name: 'room_name')
  final String roomName;
  @JsonKey(name: 'booking_date')
  final DateTime bookingDate;
  @JsonKey(name: 'date_move_in')
  final DateTime dateMoveIn;
  @JsonKey(name: 'date_move_out')
  final DateTime dateMoveOut;
  @JsonKey(name: 'total_days')
  final double totalDays;
  @JsonKey(name: 'electric_number')
  final double electricNumber;
  @JsonKey(name: 'electric_price')
  final double electricPrice;
  @JsonKey(name: 'deposits')
  final double deposits;
  @JsonKey(name: 'img_electric')
  final String imgElectric;
  @JsonKey(name: 'img_room_rates')
  final String imgRoomRates;
  @JsonKey(name: 'img_water')
  final String imgWater;
  @JsonKey(name: 'junk_money')
  final double junkMoney;
  @JsonKey(name: 'num_of_member')
  final int numOfMember;
  @JsonKey(name: 'room_rates')
  final double roomRates;
  @JsonKey(name: 'water_number')
  final double waterNumber;
  @JsonKey(name: 'water_price')
  final double waterPrice;

  /// Connect the generated [_$RoomFromJson] function to the `fromJson`
  /// factory.
  Room({
    required this.roomId,
    required this.flowId,
    required this.area,
    required this.statusRoom,
    required this.roomName,
    required this.bookingDate,
    required this.dateMoveIn,
    required this.dateMoveOut,
    required this.electricNumber,
    required this.electricPrice,
    required this.deposits,
    required this.totalDays,
    required this.imgElectric,
    required this.imgRoomRates,
    required this.imgWater,
    required this.junkMoney,
    required this.numOfMember,
    required this.roomRates,
    required this.waterNumber,
    required this.waterPrice,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  /// Connect the generated [_$RoomToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
