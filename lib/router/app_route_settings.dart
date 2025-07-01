import 'package:flutter/material.dart';
import 'package:flutter_widgets/error/not_found_page.dart';
import 'package:flutter_widgets/main/main_page.dart';
import 'package:flutter_widgets/test/dash_line_test.dart';
import 'package:flutter_widgets/test/event_bus_test.dart';
import 'package:flutter_widgets/test/file_picker_test.dart';
import 'package:flutter_widgets/test/isolate_utils_test.dart';
import 'package:flutter_widgets/test/nest_scrollView_test.dart';
import 'package:flutter_widgets/test/network_info_plus_test.dart';
import 'package:flutter_widgets/test/package_info_test.dart';
import 'package:flutter_widgets/test/path_provider_test.dart';
import 'package:flutter_widgets/test/provider_test.dart';
import 'package:flutter_widgets/test/pull_to_refresh_test.dart';
import 'package:flutter_widgets/test/shared_preferences_test.dart';
import 'package:flutter_widgets/test/tap_region_test.dart';
import 'package:flutter_widgets/test/wifi_check_test.dart';

/// @author：yongfeng
/// @data：2024/7/29 17:18
///
///

class AppRouteParam {
  ///
  AppRouteParam._internal();

  static const mainPage = "/mainPage";
  static const nestScrollViewTest = "/NestScrollViewTest";
  static const dashLineTest = "/DashLineTest";
  static const filePickerTest = "/FilePickerTest";
  static const wifiCheckTest = "/WifiCheckTest";
  static const networkInfoPlusTest = "/NetworkInfoPlusTest";
  static const pathProviderTest = "/PathProviderTest";
  static const packageInfoTest = "/PackageInfoTest";
  static const sharedPreferencesTest = "/SharedPreferencesTest";
  static const pullToRefreshTest = "/PullToRefreshTest";
  static const isolateUtilsTest = "/IsolateUtilsTest";
  static const tapRegionTest = "/tapRegionTest";
  static const providerTest = "/providerTest";
  static const eventBusTest = "/eventBusTest";
}

///通过settings.arguments传递参数
Route appGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
    switch (settings.name) {
      case AppRouteParam.mainPage:
        return const MainPage();
      case AppRouteParam.nestScrollViewTest:
        return const NestScrollViewTest();
      case AppRouteParam.dashLineTest:
        return const DashLineTest();
      case AppRouteParam.filePickerTest:
        return const FilePickerTest();
      case AppRouteParam.wifiCheckTest:
        return const WifiCheckTest();
      case AppRouteParam.networkInfoPlusTest:
        return const NetworkInfoPlusTest();
      case AppRouteParam.pathProviderTest:
        return const PathProviderTest();
      case AppRouteParam.packageInfoTest:
        return const PackageInfoTest();
      case AppRouteParam.sharedPreferencesTest:
        return const SharedPreferencesTest();
      case AppRouteParam.pullToRefreshTest:
        return const PullToRefreshTest();
      case AppRouteParam.isolateUtilsTest:
        return const IsolateUtilsTest();
      case AppRouteParam.tapRegionTest:
        return const TapRegionTest();
      case AppRouteParam.providerTest:
        return const ProviderTest();
      case AppRouteParam.eventBusTest:
        return const EventBusTest();
      default:
        return const NotFoundPage();
    }
  });
}
