import 'package:flutter/material.dart';

class CustomFontStyle {
  static TextStyle getTextStyle({
    Color? color,
    bool bold = false,
    bool medium = false,
    bool semiBold = false,
    bool light = false,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    fontWeight ??= bold
        ? FontWeight.bold
        : medium
            ? FontWeight.w500
            : semiBold
                ? FontWeight.w600
                : light
                    ? FontWeight.w300
                    : FontWeight.normal;
    return TextStyle(
      color: color ?? Colors.white,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }
}
