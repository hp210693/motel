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
import 'package:motel/bloc/sign-up/signup_bloc.dart';
import 'package:motel/bloc/sign-up/signup_event.dart';
import 'package:motel/bloc/sign-up/signup_state.dart';
import 'package:motel/utility/ut_color.dart';
import 'package:motel/utility/ut_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpScreen());
  }

  @override
  State<SignUpScreen> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpScreen> {
  var userName = "";
  var cid = "";
  var phone = "";
  var passWord = "";
  var repassWord = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (_) => SignUpBloc(), child: viewChild()),
      builder: EasyLoading.init(),
    );
  }

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
        BlocProvider.of<NavRouterBloc>(context).add(NavRouterEvent.bottomBar);
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

  Widget infoView() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tên người dùng",
            style: UTStyles.text[1],
          ),
          TextField(
            onChanged: (value) => userName = value,
            decoration: InputDecoration(
              hintText: "Nhập tên hoặc email",
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
          const SizedBox(height: 20),
          Text(
            "Số điện thoại",
            style: UTStyles.text[1],
          ),
          TextField(
            onChanged: (value) => userName = value,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Nhập Số điện thoại",
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
          const SizedBox(height: 20),
          Text(
            "Căn cước công dân",
            style: UTStyles.text[1],
          ),
          TextField(
            onChanged: (value) => userName = value,
            decoration: InputDecoration(
              hintText: "Nhâp CCCD hoặc CMND",
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
          const SizedBox(height: 20),
          Text(
            "Mật khẩu",
            style: UTStyles.text[1],
          ),
          TextField(
            onChanged: (value) => passWord = value,
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
          const SizedBox(height: 20),
          Text(
            "Nhập lại mật khẩu",
            style: UTStyles.text[1],
          ),
          TextField(
            onChanged: (value) => passWord = value,
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

  Widget submitView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: () {
          log("user click button login");
          context.read<SignUpBloc>().add(SignUpNewEvent("","","",""));
        },
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: UTColors.backGround[4],
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Center(
            child: Text(
              "Tạo mới",
              style: UTStyles.text[3],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomView() {
    return Center(
      child: InkWell(
        onTap: () {
          BlocProvider.of<NavRouterBloc>(context).add(NavRouterEvent.login);
        },
        child: Text(
          "Quay lại trang đăng nhập?",
          style: UTStyles.text[4],
        ),
      ),
    );
  }

  Widget viewChild() {
    EasyLoading.init();
    return Scaffold(
      backgroundColor: UTColors.backGround[1],
      body: BlocBuilder<SignUpBloc, SignUpState>(
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
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 20),
                      child: Text(
                        "Đăng ký tài khoản",
                        style: UTStyles.title[3],
                      ),
                    ),
                    infoView(),
                    const SizedBox(height: 30),
                    submitView(context),
                    const SizedBox(height: 15),
                    bottomView(),
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
