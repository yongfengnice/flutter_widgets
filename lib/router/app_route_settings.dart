import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/nest_scrollView_test.dart';

/// @author：yongfeng
/// @data：2024/7/29 17:18
///
///

class AppRouteParam {

  ///
  AppRouteParam._internal();

  static String nestScrollViewTest = "/NestScrollViewTest";
}

Route appGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
    if (settings.name == AppRouteParam.nestScrollViewTest) {
      return const NestScrollViewTest();
    }
    return const NestScrollViewTest();
  });
}
