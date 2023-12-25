import 'package:flutter/material.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static push(Widget page) => navigator.push(
        /*   MaterialPageRoute(builder: (_) => page),
      );*/
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            }),
      );
  static pushDiagloFullScreen(Widget page) => navigator.push(
          /*   MaterialPageRoute(fullscreenDialog: true, builder: (_) => page),
      ); */
          PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ));
  /*  PageRouteBuilder(
            fullscreenDialog: true,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            }),
      ); */

  static pushAndRemoveUntil(Widget page) => navigator.pushAndRemoveUntil<void>(
        MaterialPageRoute(builder: (_) => page),
        (route) => false,
      );

  static pushReplacement(Widget page) => navigator.pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );

  static pop() => navigator.maybePop();
}
