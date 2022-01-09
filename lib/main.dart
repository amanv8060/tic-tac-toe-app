import 'package:flutter/material.dart';
import 'package:tictactoe/app.dart';
import 'package:tictactoe/utils/get_it/locator.dart';

void main() async {
  setupLocator();
  runApp(const TicTacToe());
}
