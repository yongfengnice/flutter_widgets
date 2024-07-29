import 'package:flutter/widgets.dart';

/// @author：yongfeng
/// @data：2024/7/29 17:09
///
class AppRouter {
  ///单例模式
  static AppRouter instance = AppRouter._internal();

  AppRouter._internal();

  factory AppRouter() {
    return instance;
  }

  void push(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }
}
