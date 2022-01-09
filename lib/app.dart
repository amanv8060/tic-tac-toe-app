import 'package:flutter/material.dart';
import 'package:tictactoe/screens/splash/screen.dart';
import 'package:tictactoe/utils/theme/app_theme.dart';

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tic Tac Toe',
        theme: AppTheme.globalTheme,
        home: SplashScreen());
  }
}
