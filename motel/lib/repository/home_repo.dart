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
import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:motel/api/base_api_service.dart';
import 'package:motel/api/network_api_service.dart';
import 'package:motel/data/room.dart';

class HomeRepo {
  final BaseApiService _apiService = NetworkApiService();
  late Map<String, List<Room>> _rooms;

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
