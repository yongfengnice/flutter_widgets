import 'package:flutter_widgets/entity/category_item_entity.dart';
import 'package:flutter_widgets/router/app_route_settings.dart';

/// @author：yongfeng
/// @data：2024/8/1 18:59
///
class CategoryModel {
  ///
  final List<CategoryItemEntity> _categoryList = [];

  CategoryModel() {
    _categoryList.add(CategoryItemEntity(
      text: 'NestedScrollView 滚动测试',
      routeName: AppRouteParam.nestScrollViewTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'DashDecoration虚线测试',
      routeName: AppRouteParam.dashLineTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'FilePicker文件选择测试',
      routeName: AppRouteParam.filePickerTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'ConnectivityPlus网络类型判断测试',
      routeName: AppRouteParam.wifiCheckTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'NetworkInfoPlus网络信息获取测试',
      routeName: AppRouteParam.networkInfoPlusTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'pathProvider文件路径操作测试',
      routeName: AppRouteParam.pathProviderTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'PackageInfo获取包信息测试',
      routeName: AppRouteParam.packageInfoTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'shared_preferences数据存储测试',
      routeName: AppRouteParam.sharedPreferencesTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'pull_to_refresh下拉刷新测试',
      routeName: AppRouteParam.pullToRefreshTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'isolate工具测试',
      routeName: AppRouteParam.isolateUtilsTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'TapRegion实现自定义PopMenu',
      routeName: AppRouteParam.tapRegionTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'ProviderTest使用测试',
      routeName: AppRouteParam.providerTest,
    ));
    _categoryList.add(CategoryItemEntity(
      text: 'EventBus使用测试',
      routeName: AppRouteParam.eventBusTest,
    ));
  }

  List<CategoryItemEntity> getCategoryList() {
    return _categoryList;
  }
}
