import 'package:flutter/material.dart';

class AppDimensions extends InheritedWidget {
  final double height;

  AppDimensions({required this.height, required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(AppDimensions oldWidget) {
    return oldWidget.height != height;
  }

  static AppDimensions of(BuildContext context) {
    final AppDimensions? result = context.dependOnInheritedWidgetOfExactType<AppDimensions>();
    assert(result != null, 'No AppDimensions found in context');
    return result!;
  }
}
