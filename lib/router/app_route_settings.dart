import 'package:flutter/material.dart';
import 'package:flutter_widgets/error/not_found_page.dart';
import 'package:flutter_widgets/test/dash_line_test.dart';
import 'package:flutter_widgets/test/file_picker_test.dart';
import 'package:flutter_widgets/test/nest_scrollView_test.dart';
import 'package:flutter_widgets/test/wifi_check_test.dart';

/// @author：yongfeng
/// @data：2024/7/29 17:18
///
///

class AppRouteParam {
  ///
  AppRouteParam._internal();

  static const nestScrollViewTest = "/NestScrollViewTest";
  static const dashLineTest = "/DashLineTest";
  static const filePickerTest = "/FilePickerTest";
  static const wifiCheckTest = "/WifiCheckTest";
}

///通过settings.arguments传递参数
Route appGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
    switch (settings.name) {
      case AppRouteParam.nestScrollViewTest:
        return const NestScrollViewTest();
      case AppRouteParam.dashLineTest:
        return const DashLineTest();
      case AppRouteParam.filePickerTest:
        return const FilePickerTest();
      case AppRouteParam.wifiCheckTest:
        return const WifiCheckTest();
      default:
        return const NotFoundPage();
    }
  });
}
