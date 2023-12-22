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
import 'package:motel/data/room.dart';

abstract class NavRouterState {}

class NavAppInitState extends NavRouterState {}

class NavSplashState extends NavRouterState {}

class NavLoginState extends NavRouterState {}

class NavSignUpState extends NavRouterState {}

class NavBottomBarState extends NavRouterState {}

class NavForgotPassState extends NavRouterState {}

class NavHomeState extends NavRouterState {}

class NavDetailState extends NavRouterState {
  final Room _room;
  NavDetailState(this._room);
  Room get room => _room;
}

class NavNothingState extends NavRouterState {}


/* enum NavRouterState {
  appInit,
  loading,
  splash,
  login,
  signUp,
  forgotPass,
  home,
  bottomBar,
  detail,
  nothing,
} */
