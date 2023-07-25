import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:motel/data/api/base_api_service.dart';
import 'package:motel/data/api/network_api_service.dart';
import 'package:motel/data/home/room.dart';
import 'package:motel/repository/home/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final BaseApiService _apiService = NetworkApiService();
  late Map<String, List<Room>> _rooms;

  @override
  Future<Map<String, List<Room>>> getHomeFetchData(String jwt) async {
    try {
      final data = await _apiService.getHomeResponse(jwt);
      final listJson = jsonDecode(data);
      log("HomeRepoImp - convert data ok\n ");
      // Remember remove dynamic error
      //_rooms = groupBy(listJson, (dynamic obj) => obj['flow_id']);
      final listRoom =
          List<Room>.from(listJson.map((object) => Room.fromJson(object)))
              .toList();
      _rooms = groupBy(listRoom, (Room obj) => obj.flowId.toString());
      log("$_rooms");
      return _rooms;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
