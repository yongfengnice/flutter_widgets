import 'package:flutter/material.dart';
import 'package:flutter_widgets/constant/app_constants.dart';

/// @author：yongfeng
/// @data：2024/7/26 15:49
///
class HomeTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final TabController? controller;

  const HomeTabBar({super.key, required this.tabs, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstant.kAppToolbarHeight,
      color: Colors.white,
      child: TabBar(
        tabs: tabs,
        dividerColor: Colors.amber,
        indicatorColor: Colors.amber,
        labelColor: Colors.amber,
        controller: controller,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, AppConstant.kAppToolbarHeight);
}
