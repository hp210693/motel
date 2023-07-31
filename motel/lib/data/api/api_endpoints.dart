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
        _urlBase = 'http://localhost:8080/';
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
