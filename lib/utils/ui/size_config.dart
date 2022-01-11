import 'package:flutter/material.dart';

class SizeConfig {
  //ignore: constant_identifier_names
  static const double ASSUMED_SCREEN_HEIGHT = 760.0;
  //ignore: constant_identifier_names
  static const double ASSUMED_SCREEN_WIDTH = 412.0;
  static late MediaQueryData _mediaQueryData;

  /// Current width of the screen
  static late double screenWidth;

  /// Current height of the screen
  static late double screenHeight;

  /// width of one block in screen (Assumung the entire screen can accomodate
  /// 100 blocks)
  static late double blockSizeHorizontal;

  /// height of one block in screen (Assumung the entire screen can accomodate
  ///  100 blocks)
  static late double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  static double _fitContext(assumedValue, currentValue, value) =>
      (value / assumedValue) * currentValue;

  static double fitToWidth(value) =>
      _fitContext(ASSUMED_SCREEN_WIDTH, screenWidth, value);

  static double fitToHeight(value) =>
      _fitContext(ASSUMED_SCREEN_HEIGHT, screenHeight, value);
}
