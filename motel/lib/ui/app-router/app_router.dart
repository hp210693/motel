import 'package:flutter/material.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static push(Widget page) => navigator.push(
        MaterialPageRoute(builder: (_) => page),
      );

  static pushAndRemoveUntil(Widget page) => navigator.pushAndRemoveUntil<void>(
        MaterialPageRoute(builder: (_) => page),
        (route) => false,
      );

  static pushReplacement(Widget page) => navigator.pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );

  static pop() => navigator.maybePop();
}
