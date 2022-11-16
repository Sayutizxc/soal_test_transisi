import 'package:flutter/cupertino.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle small({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 12,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle normal({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 14,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle medium({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 16,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle big({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 24,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
