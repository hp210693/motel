import 'dart:core';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'room.g.dart';

@JsonSerializable()
class Room {
  @JsonKey(name: 'room_id')
  final int roomId;
  @JsonKey(name: 'flow_id')
  final int? flowId;
  @JsonKey(name: 'status_room')
  final int statusRoom;
  @JsonKey(name: 'room_name')
  final String roomName;
  @JsonKey(name: 'booking_date')
  final DateTime? bookingDate;
  @JsonKey(name: 'date_move_in')
  final DateTime? dateMoveIn;
  @JsonKey(name: 'date_move_out')
  final DateTime? dateMoveOut;
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
