import 'package:flutter/material.dart';
import 'package:flutter_widgets/bean/bottom_tab_bean.dart';
import 'package:flutter_widgets/category/category_page.dart';
import 'package:flutter_widgets/home/bottom_tab_widget.dart';
import 'package:flutter_widgets/home/home_page.dart';
import 'package:flutter_widgets/mine/mine_page.dart';
import 'package:flutter_widgets/resouce/resource_image.dart';
import 'package:flutter_widgets/resouce/resource_text.dart';
import 'package:flutter_widgets/smart/smart_page.dart';

/// @author：yongfeng
/// @data：2024/7/25 10:52
///
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin<MainPage> {
  final PageController pageController = PageController(initialPage: 0);
  final ValueNotifier<int> selectedNotifier = ValueNotifier(0);

  final List<Widget> pageList = [
    HomePage(),
    SmartPage(),
    CategoryPage(),
    MinePage(),
  ];

  final List<BottomTabBean> tabBeanList = [
    BottomTabBean(0, kIcBottomTabHome, kTxtHome),
    BottomTabBean(1, kIcBottomTabSmart, kTxtSmart),
    BottomTabBean(2, kIcBottomTabCategory, kTxtCategory),
    BottomTabBean(3, kIcBottomTabMine, kTxtMine),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(), //禁止滚动
        controller: pageController,
        children: pageList,
        onPageChanged: (index) {
          selectedNotifier.value = index;
        },
      ),
      bottomNavigationBar: BottomTabWidget(
        selectedNotifier: selectedNotifier,
        tabBeanList: tabBeanList,
        itemClick: (index) {
          pageController.animateToPage(index, duration: kTabScrollDuration, curve: Curves.easeIn);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
