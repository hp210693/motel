import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:motel/data/api/base_api_service.dart';
import 'package:motel/data/api/network_api_service.dart';
import 'package:motel/repository/home/home_repo.dart';
import 'package:motel/data/home/room.dart';

class HomeRepoImp implements HomeRepo {
  final BaseApiService _apiService = NetworkApiService();
  late List<Room> _rooms;

  @override
  Future<List<Room>> getHomeFetchData(String jwt) async {
    try {
      final data = await _apiService.getHomeResponse(jwt);
      // log("HomeRepoImp - getHomeFetchData\n $data");

      List<dynamic> listJson = jsonDecode(data);
      _rooms =
          List<Room>.from(listJson.map<Room>((dynamic i) => Room.fromJson(i)));
      log("HomeRepoImp - convert data ok\n $_rooms");
      return _rooms;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
