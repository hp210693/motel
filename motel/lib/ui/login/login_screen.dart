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
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:motel/bloc/login/login_bloc.dart';
import 'package:motel/bloc/login/login_event.dart';
import 'package:motel/bloc/login/login_state.dart';
import 'package:motel/bloc/nav-router/nav_router_bloc.dart';
import 'package:motel/bloc/nav-router/nav_router_event.dart';
import 'package:motel/utility/ut_color.dart';
import 'package:motel/utility/ut_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  var userName = "";
  var password = "";

  /*  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (_) => LoginBloc(), child: viewChild()),
      builder: EasyLoading.init(),
    );
  } */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => LoginBloc(),
        child: Scaffold(
          backgroundColor: UTColors.backGround[1],
          body: viewChild(),
        ),
      ),
      builder: EasyLoading.init(),
    );
  }

/*   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UTColors.backGround[1],
      body: BlocProvider(
        create: (_) => LoginBloc(),
        child: viewChild(),
      ),
    );
  } */

  void navigateBlocState(state) {
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
        BlocProvider.of<NavRouterBloc>(context).add(NavBottomBarEvent());
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

  Widget userNameView() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tài khoản",
            style: UTStyles.text[1],
          ),
          TextField(
            onChanged: (value) => userName = value,
            decoration: InputDecoration(
              hintText: "Nhập số điện thoại hoặc email",
              border: InputBorder.none,
              hintStyle: UTStyles.text[2],
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: UTColors.text[3]),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: UTColors.text[3]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget passWordView() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mật khẩu",
            style: UTStyles.text[1],
          ),
          TextField(
            onChanged: (value) => password = value,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Nhập mật khẩu",
              border: InputBorder.none,
              hintStyle: UTStyles.text[2],
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: UTColors.text[3]),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: UTColors.text[3]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget forgetView() {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 20, right: 20),
        child: InkWell(
          onTap: () {
            context.read<NavRouterBloc>().add(NavForgotPassEvent());
          },
          child: Text(
            "Quên mật khẩu?",
            style: UTStyles.text[2],
          ),
        ),
      ),
    );
  }

  Widget loginView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: () {
          log("user click button login");
          context.read<LoginBloc>().add(LoginInEvent(userName, password));
        },
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: UTColors.backGround[4],
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Center(
            child: Text(
              "Đăng nhập",
              style: UTStyles.text[3],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomView() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bạn chưa phải là thành viên?",
            style: UTStyles.text[4],
          ),
          InkWell(
            onTap: () {
              BlocProvider.of<NavRouterBloc>(context).add(NavSignUpEvent());
            },
            child: Text(
              " Đăng ký,",
              style: UTStyles.text[5],
            ),
          ),
          InkWell(
            onTap: () {
              BlocProvider.of<NavRouterBloc>(context).add(NavBottomBarEvent());
            },
            child: Text(
              " Tiếp tục",
              style: UTStyles.text[5],
            ),
          ),
        ],
      ),
    );
  }

  Widget viewChild() {
    //EasyLoading.init();
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        navigateBlocState(state);
        return SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                    child: Text(
                      "Đăng nhập",
                      style: UTStyles.title[3],
                    ),
                  ),
                  userNameView(),
                  const SizedBox(height: 30),
                  passWordView(),
                  const SizedBox(height: 5.0),
                  forgetView(),
                  loginView(context),
                  const SizedBox(height: 30),
                  bottomView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
