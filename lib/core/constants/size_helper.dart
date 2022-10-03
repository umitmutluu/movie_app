
import 'dart:math';

import 'package:flutter/material.dart';

class SizeHelper {
  static final SizeHelper _instance = SizeHelper._internal();

  factory SizeHelper() {
    return _instance;
  }

  SizeHelper._internal() {
    print("SizeHelper oluşturuldu");
  }

  BuildContext? _context;
  BuildContext? get context => _context;
  set context(BuildContext? context) {
    _context = context;
    print("SizeHelper context setted");
  }

  EdgeInsets? _padding;
  EdgeInsets? get padding => _padding;
  set padding(EdgeInsets? ei) {
    _padding = ei;
    print("SizeHelper padding setted");
  }

  Size? _size;
  Size? get size => _size;

  void setSize(Size? size) {
    _size = size;
  }

  final Size _xdScreenSize = const Size(376, 812);

  double getDouble(double val) => XdHelper.getScaledDouble(
    size: _size,
    xdDouble: val,
    xdScreenSize: _xdScreenSize,
  );

  Size getSize(Size val) => XdHelper.getScaledSize(
    size: _size,
    xdContainerSize: val,
    xdScreenSize: _xdScreenSize,
  );

  double getHeight(double val) => XdHelper.getScaledSize(
    size: _size,
    xdContainerSize: Size(1, val),
    xdScreenSize: _xdScreenSize,
  ).height;

  double getWidth(double val) => XdHelper.getScaledSize(
    size: _size,
    xdContainerSize: Size(val, 1),
    xdScreenSize: _xdScreenSize,
  ).width;

  SizedBox sbh(double val) {
    return SizedBox(height: getHeight(val));
  }

  SizedBox sbw(double val) {
    return SizedBox(width: getWidth(val));
  }
}

class XdHelper {
  static double getScaledFontSize({
    required Size? size,
    required double fontSize,
    required Size? xdScreenSize,
  }) {
    double sizeRatio = sqrt(pow(size!.height, 2) + pow(size.width, 2));
    double xdRatio =
    sqrt(pow(xdScreenSize!.height, 2) + pow(xdScreenSize.width, 2));
    return fontSize * sizeRatio / xdRatio;
  }

  static double getScaledDouble({
    required Size? size,
    required double xdDouble,
    required Size? xdScreenSize,
  }) {
    double sizeRatio = sqrt(pow(size!.height, 2) + pow(size.width, 2));
    double xdRatio =
    sqrt(pow(xdScreenSize!.height, 2) + pow(xdScreenSize.width, 2));
    return xdDouble * sizeRatio / xdRatio;
  }

  static Size getScaledSize({
    required Size? size,
    required Size? xdContainerSize,
    required Size? xdScreenSize,
  }) {
    return Size(
      (xdContainerSize!.width * size!.width) / (xdScreenSize!.width),
      (xdContainerSize.height * size.height) / (xdScreenSize.height),
    );
  }
}
