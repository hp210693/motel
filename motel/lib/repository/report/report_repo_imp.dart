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
import 'package:motel/data/api/base_api_service.dart';
import 'package:motel/data/api/network_api_service.dart';
import 'package:motel/data/report/report.dart';
import 'package:motel/repository/report/report_repo.dart';

class ReportRepoImp implements ReportRepo {
  final BaseApiService _apiService = NetworkApiService();
  late Map<String, List<Report>> _reports;
  @override
  Future<Map<String, List<Report>>> getReportFetchData() async {
    try {
      final data = await _apiService.getReportResponse('');
      log("ReportRepoImp - getLoginInData\n $data");
      final jsonData = jsonDecode(data);
      final listReport =
          List<Report>.from(jsonData.map((object) => Report.fromJson(object)))
              .toList();

      _reports =
          groupBy(listReport, (Report obj) => obj.createdDate.toString());
      log("LoginRepoImp - convert data ok\n $listReport");
      return _reports;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
