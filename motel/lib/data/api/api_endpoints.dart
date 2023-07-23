enum Environment { developing, testting, production }

class ApiEndPoints {
  final Environment _evm = Environment.developing;
  late String _urlBase = '';
  ApiEndPoints() {
    switch (_evm) {
      case Environment.developing:
        //_urlBase = 'http://localhost:8080/';
        _urlBase = 'http://10.0.2.2:8080/';
        break;
      case Environment.production:
        _urlBase = 'localhost:8000/';
        break;
      case Environment.testting:
      default:
        _urlBase = 'localhost:1234/';
    }
  }
}

extension V1 on ApiEndPoints {
  String loginUrl(String userName, String passWord) {
    return '${_urlBase}login?user=' '$userName' '&pass=' '$passWord';
  }

  String accountsUrl() {
    return '${_urlBase}account';
  }

  String roomsUrl() {
    return '${_urlBase}room';
  }
}
