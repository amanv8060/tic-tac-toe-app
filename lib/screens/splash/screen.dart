import 'package:flutter/material.dart';
import 'package:tictactoe/screens/home/screen.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/utils/get_it/locator.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /// navigate to [HomeScreen]
    Future.delayed(const Duration(milliseconds: 750), () {
      locator<NavigationService>().pushReplacementScreen(HomeScreen.routeName,
          arguments: {"animate": true});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
