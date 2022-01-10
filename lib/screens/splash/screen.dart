import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/screens/home/screen.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/utils/theme/app_theme.dart';
import 'package:tictactoe/utils/theme/font_style.dart';
import 'package:tictactoe/utils/ui/size_config.dart';

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

    // navigate to [HomeScreen]
    Future.delayed(const Duration(seconds: 3), () {
      locator<NavigationService>().pushReplacementScreen(HomeScreen.routeName,
          arguments: {"animate": true});
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: AvatarGlow(
              endRadius: SizeConfig.fitToWidth(150),
              duration: const Duration(milliseconds: 1000),
              glowColor: Colors.white,
              repeat: true,
              repeatPauseDuration: const Duration(milliseconds: 500),
              startDelay: const Duration(milliseconds: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.none,
                    ),
                    shape: BoxShape.circle),
                child: CircleAvatar(
                  backgroundColor: AppTheme.greyColor,
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.fitToWidth(16)),
                    child: Image.asset(
                      'assets/images/logo.png',
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                  ),
                  radius: SizeConfig.fitToWidth(100),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.fitToHeight(100)),
            child: Text(
              "TIC TAC TOE",
              style: CustomFontStyle.getTextStyle(fontSize: 32),
            ),
          ),
        ],
      ),
    ));
  }
}
