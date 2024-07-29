import 'package:flutter/material.dart';
import 'package:flutter_widgets/entity/category_item_entity.dart';
import 'package:flutter_widgets/router/app_route_settings.dart';
import 'package:flutter_widgets/router/app_router.dart';

/// @author：yongfeng
/// @data：2024/7/29 16:57
///
class CategoryListItem extends StatelessWidget {
  final CategoryItemEntity entity;

  const CategoryListItem({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.instance.push(context, AppRouteParam.nestScrollViewTest);
      },
      child: Container(
        color: Colors.deepOrangeAccent,
        padding: const EdgeInsets.all(10),
        child: Text(entity.text),
      ),
    );
  }
}
