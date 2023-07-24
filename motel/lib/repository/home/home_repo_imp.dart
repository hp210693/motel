import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:motel/data/api/base_api_service.dart';
import 'package:motel/data/api/network_api_service.dart';
import 'package:motel/repository/home/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final BaseApiService _apiService = NetworkApiService();
  late Map _rooms;

  @override
  Future<Map> getHomeFetchData(String jwt) async {
    try {
      final data = await _apiService.getHomeResponse(jwt);
      final listJson = jsonDecode(data);
      log("HomeRepoImp - convert data ok\n ");
      // Remember remove dynamic error
      _rooms = groupBy(listJson, (dynamic obj) => obj['flow_id']);
      log("$_rooms");
      return _rooms;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
