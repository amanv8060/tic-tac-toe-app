import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAndPushScreen(String routeName, {dynamic arguments}) {
    navigatorKey.currentState!.pop();
    return pushScreen(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> removeAllAndPush(String routeName, String tillRoute,
      {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(tillRoute),
        arguments: arguments);
  }

  void pushDialog(Widget dialog, {bool dismissable = false}) {
    showDialog(
        context: navigatorKey.currentContext!,
        barrierColor: Colors.transparent,
        barrierDismissible: dismissable,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  void showSnackBar(String message,
      {Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: duration,
        content: Text(message)));
  }

  void pop<T>() {
    return navigatorKey.currentState!.pop<T>();
  }

  void popwithData<T>(T data) {
    return navigatorKey.currentState!.pop<T>(data);
  }

  BuildContext? getContext() {
    return navigatorKey.currentContext;
  }

  bool isNavigatorKeyNull() {
    return navigatorKey.currentState == null;
  }
}
