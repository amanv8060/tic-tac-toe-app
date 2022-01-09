import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color lightGreyColor = Color(0xffa19fa5);
  static const Color toastColor = Color(0xff303030);
  static const Color lightBlueColor = Color(0xff179cde);
  static const Color greyColor = Color(0xff424242);
  static const Color white = Color(0xfffafafa);

  static const Color darkPurple = Color(0xff080323);
  static const Color secondaryColor = Color(0xff575aff);
  static const Color primaryColor = Color(0xff1d156b);
  static const Color blue = Color(0xff3527e5);
  static const Color green = Color(0xff4ec0ff);
  static const Color purple = Color(0xff401a55);
  static const Color pinkishpurple = Color(0xff973dd2);
  static const Color orange = Color(0xffc2798d);

  static final ThemeData globalTheme = ThemeData(
    androidOverscrollIndicator: null,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.light),
      iconTheme: IconThemeData(color: primaryColor),
    ),
    backgroundColor: primaryColor,
  );
}
