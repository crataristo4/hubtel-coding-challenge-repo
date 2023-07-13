import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/mainpage/main.page.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    ///[args] is used to determine messages at runtime
    ///if a lot of data is need to be passed to a constructor to another page convert [args] to Map
    ///Example args as Map<String,dynamic> then put value in constructor
    final args = settings.arguments;

    switch (settings.name) {
      ///splash screen page
      case SplashScreen.routeName:
        return CustomPageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const SplashScreen());

      ///main page route
      case MainPage.routeName:
        return CustomPageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => const MainPage());

      default:
        //error page
        return _errorRoute();
    }
  }

//error page ..
  //todo modify page for error routing
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text("Page not Found"),
        ),
      );
    });
  }
}

class CustomPageRouteBuilder<T> extends PageRoute<T> {
  final RoutePageBuilder pageBuilder;
  final PageTransitionsBuilder matchingBuilder =
      const CupertinoPageTransitionsBuilder(); // Default iOS/macOS (to get the swipe right to go back gesture)
  // final PageTransitionsBuilder matchingBuilder = const FadeUpwardsPageTransitionsBuilder(); // Default Android/Linux/Windows

  CustomPageRouteBuilder({required this.pageBuilder});

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return pageBuilder(context, animation, secondaryAnimation);
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: Platform.isAndroid ? 200 : 300); // Can give custom Duration,
  // unlike in
  // MaterialPageRoute

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return matchingBuilder.buildTransitions<T>(this, context, animation, secondaryAnimation, child);
  }
}
