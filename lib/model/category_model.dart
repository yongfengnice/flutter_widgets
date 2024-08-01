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
  }

  List<CategoryItemEntity> getCategoryList() {
    return _categoryList;
  }
}
