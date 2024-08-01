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

  Future<T?> push<T extends Object?>(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  void pop<T extends Object?>(BuildContext context, [T? result]) {
    Navigator.of(context).pop<T>(result);
  }
}
