import 'package:flutter/material.dart';

class AppSizes {
  static const double spacingSmall = 4.0;
  static const double spacingNormal = 8.0;
  static const double spacingMedium = 12.0;
  static const double spacingLarge = 16.0;
  static const double spacingWide = 20;
  static const double buttonHeight = 48;
  static const double buttonWidth = 270;
  static const double itemHeight = 45.0;
  static const double size24 = 24.0;
  static const double size16 = 16.0;
  static const double size12 = 12.0;
  static const double size8 = 8.0;
  static const double size4 = 4.0;

  static double screenHeight = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).size.height;
  static double screenWidth = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).size.width;

}