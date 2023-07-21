import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:motel/data/api/api_endpoints.dart';
import 'package:motel/data/api/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:motel/error_base/error_base.dart';

class NetworkApiService extends BaseApiService {
  late Response _response;
  @override
  Future<dynamic> getLoginResponse(String userName, String passWord) async {
    String url = ApiEndPoints().loginUrl(userName, passWord);
    log("go NetworkApiService url = $url");
    await http.get(Uri.parse(url)).then(
      (value) {
        if (value.statusCode == 200) {
          log(value.body);
          return value.body;
        }
      },
    ).onError(
      (error, stackTrace) {
        var err = ErrorBase();
        if (error is SocketException) {
          err.statusCode = error.osError!.errorCode;
          err.message = error.osError!.message;
          throw Exception(err);
        }
        err.statusCode = 0;
        err.message = "unknow";
        log("NetworkApiService error \n ${error.toString()}");
        throw Exception(err);
      },
    );

    ;

    /* try {
      String url = ApiEndPoints().loginUrl(userName, passWord);
      log("go NetworkApiService url = $url");
      _response = await http.get(Uri.parse(url));

      if (_response.statusCode == 200) {
        return _response.body;
      }
    } on SocketException catch (e) {
      var error = ErrorBase();
      if (e.osError?.errorCode == 101) {
        error.statusCode = 101;
        error.message = e.osError!.message;
        throw Exception(error);
      }
      error.statusCode = e.osError!.errorCode;
      error.message = e.osError!.message;

      log("NetworkApiService error \n ${e.message}");
      throw Exception(error);
    } */
  }
}
