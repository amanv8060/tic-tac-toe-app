import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/screens/error/not_found.dart';
import 'package:tictactoe/screens/help/screen.dart';
import 'package:tictactoe/screens/history/screen.dart';
import 'package:tictactoe/screens/home/screen.dart';
import 'package:tictactoe/screens/splash/screen.dart';
import 'package:tictactoe/utils/navigation/fade_in_route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments == null
        ? <String, dynamic>{}
        : settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      case HomeScreen.routeName:
        {
          bool animate = args["animate"] ?? false;
          if (animate) {
            return FadeInRoute(page: const HomeScreen(), settings: settings);
          }
          return CupertinoPageRoute(builder: (_) => const HomeScreen());
        }
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case HelpScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const HelpScreen());
      case HistoryScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const HistoryScreen());
      case NotFoundScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const NotFoundScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
