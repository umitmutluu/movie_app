import 'package:flutter/material.dart';

class AppColor {
  static AppColor? _instance;

  static AppColor? get instance {
    _instance ??= AppColor._init();
    return _instance;
  }

  AppColor._init();

  Color get lightWhite => const Color.fromRGBO(222, 232, 230, 1);
  Color get black => const Color.fromRGBO(1, 1, 1, 1);
}
