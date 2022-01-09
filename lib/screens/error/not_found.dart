import 'package:flutter/material.dart';
import 'package:tictactoe/screens/home/screen.dart';
import 'package:tictactoe/services/navigation_service.dart';
import 'package:tictactoe/utils/get_it/locator.dart';
import 'package:tictactoe/utils/theme/app_theme.dart';
import 'package:tictactoe/utils/theme/font_style.dart';

class NotFoundScreen extends StatelessWidget {
  static const String routeName = "notFound";
  const NotFoundScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Oops, the requested page was not found.",
                  style: CustomFontStyle.getTextStyle(
                    fontSize: 14,
                    color: AppTheme.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    child: Text(
                      "Home",
                      style: CustomFontStyle.getTextStyle(
                        fontSize: 14,
                        color: AppTheme.white,
                      ),
                    ),
                    onPressed: () => locator<NavigationService>()
                        .pushReplacementScreen(HomeScreen.routeName)),
              )
            ],
          )),
    );
  }
}
