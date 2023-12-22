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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motel/bloc/nav-router/nav_router_bloc.dart';
import 'package:motel/bloc/nav-router/nav_router_event.dart';
import 'package:motel/bloc/nav-router/nav_router_state.dart';
import 'package:motel/data/room.dart';
import 'package:motel/ui/app-router/app_router.dart';
import 'package:motel/ui/bottom/bottom_screen.dart';
import 'package:motel/ui/detail/detail_screen.dart';
import 'package:motel/ui/forgot-pass/forgot_pass.dart';
import 'package:motel/ui/home/home_screen.dart';
import 'package:motel/ui/login/login_screen.dart';
import 'package:motel/ui/signup/signup_screent.dart';
import 'package:motel/ui/splash/splash_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppState();
}

class _AppState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavRouterBloc()..add(NavAppInitEvent()),
      child: MaterialApp(
        navigatorKey: AppRouter.navigatorKey,
        builder: (context, child) {
          return BlocListener<NavRouterBloc, NavRouterState>(
            listener: (context, state) async {
              /*  if (state is NavSplashState) {
                print("???hung - DetailScreen -- state $state");
                print(state.room);
                AppRouter.push(DetailScreen(state.room));
                return;
              }
              if (state is NavDetailState) {
                print("???hung - DetailScreen -- state $state");
                print(state.room);
                AppRouter.push(DetailScreen(state.room));
                return;
              }
              if (state is NavDetailState) {
                print("???hung - DetailScreen -- state $state");
                print(state.room);
                AppRouter.push(DetailScreen(state.room));
                return;
              }
              if (state is NavDetailState) {
                print("???hung - DetailScreen -- state $state");
                print(state.room);
                AppRouter.push(DetailScreen(state.room));
                return;
              } */
              switch (state.runtimeType) {
                case NavSplashState:
                  AppRouter.pushAndRemoveUntil(const SplashScreen());
                  await Future.delayed(const Duration(seconds: 2));
                  context.read<NavRouterBloc>().add(NavLoginEvent());
                  break;
                case NavLoginState:
                  AppRouter.pushAndRemoveUntil(const LoginScreen());
                  break;
                case NavSignUpState:
                  AppRouter.pushAndRemoveUntil(const SignUpScreen());
                  break;
                case NavForgotPassState:
                  AppRouter.pushAndRemoveUntil(const ForgotPassScreen());
                  break;
                case NavHomeState:
                  AppRouter.pushAndRemoveUntil(const HomeScreen());
                  break;
                case NavBottomBarState:
                  AppRouter.pushAndRemoveUntil(const BottomScreen());
                  break;
                case NavDetailState:
                  if (state is NavDetailState) {
                    print("???hung - DetailScreen -- state $state");
                    print(state.room);
                    AppRouter.push(DetailScreen(state.room));
                  }
                  break;
                default:
                  break;
              }
            },
            child: child,
          );
        },
        home: const SizedBox(height: 0),
        // onGenerateRoute: (_) => SplashScreen.route(),
      ),
    );
  }
}
