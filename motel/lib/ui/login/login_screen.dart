/*MIT License

Copyright (c) 2020 Hung Phan

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
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motel/bloc/login/login_bloc.dart';
import 'package:motel/bloc/login/login_event.dart';
import 'package:motel/bloc/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  var _userName = "";
  var _passWord = "";

/*   Widget _showDialog() {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: const Text('AlertDialog description'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  } */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      color: Colors.yellow,
      home: BlocProvider(create: (_) => LoginBloc(), child: _viewChild()),
      builder: EasyLoading.init(),
    );
  }

  void _navigateBlocState(state) {
    log("BlocBuilder state = $state");
    switch (state.runtimeType) {
      case LoginLoadingState:
        EasyLoading.show(
          status: 'Đợi chút nhé...',
          maskType: EasyLoadingMaskType.clear,
        );
        break;
      case LoginSuccessedState:
        EasyLoading.showSuccess(
          "Thành công",
          maskType: EasyLoadingMaskType.clear,
        );
        break;
      case LoginErrorState:
        EasyLoading.showError("Đã có lỗi xảy ra!",
            maskType: EasyLoadingMaskType.clear);
        break;
      default:
        EasyLoading.dismiss();
        break;
    }
  }

  Widget _introView() {
    return Column(
      children: [
        const Icon(
          Icons.phone_android,
          size: 60,
        ),

        const SizedBox(height: 40),

        //hello
        Text(
          "XIN CHÀO!",
          textAlign: TextAlign.center,
          style: GoogleFonts.bebasNeue(fontSize: 52),
        ),

        const SizedBox(height: 10),

        const Text(
          "Chào mừng đã quay trở lại!",
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _userNameView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextField(
            onChanged: (value) => _userName = value,
            decoration: const InputDecoration(
                hintText: "Nhập số điện thoại hoặc email",
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Widget _passWordView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextField(
            obscureText: true,
            onChanged: (value) => _passWord = value,
            decoration: const InputDecoration(
                hintText: "Nhập mật khẩu", border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Widget _loginView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: InkWell(
        onTap: () {
          log("user click button login");
          context.read<LoginBloc>().add(LoginInEvent(_userName, _passWord));
        },
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(12.0)),
          child: const Center(
            child: Text(
              "Đăng nhập",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomView() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Bạn chưa phải là thành viên?",
          style: TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
        InkWell(
          child: Text(
            " Đăng ký,",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
        ),
        InkWell(
          child: Text(
            " Tiếp tục",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }

  Widget _viewChild() {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          _navigateBlocState(state);
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _introView(),
                    _userNameView(),
                    const SizedBox(height: 10),
                    _passWordView(),
                    const SizedBox(height: 10),
                    _loginView(context),
                    const SizedBox(height: 10),
                    _bottomView(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
