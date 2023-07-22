import 'dart:io';

class ErrorBase {
  int statusCode = 200;
  String message = "successed";
  bool convertedData = true;
  dynamic getException(dynamic error) {
    switch (error.runtimeType) {
      case SocketException:
        return "No internet connection.";
      case HttpException:
        return "HTTP error occured.";

      default:
    }
  }
}
