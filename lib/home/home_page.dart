import 'package:flutter/material.dart';
import 'package:flutter_widgets/constant/app_constants.dart';
import 'package:flutter_widgets/entity/home_tab_entity.dart';
import 'package:flutter_widgets/home/home_tab_bar.dart';
import 'package:flutter_widgets/home/home_tab_view.dart';
import 'package:flutter_widgets/resouce/resource_image.dart';
import 'package:flutter_widgets/utils/image_utils.dart';

/// @author：yongfeng
/// @data：2024/7/25 10:33
///
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  List<HomeTabEntity> homeTabEntityList = [
    HomeTabEntity(name: 'Android开发'),
    HomeTabEntity(name: 'IOS开发'),
    HomeTabEntity(name: '前端开发'),
    HomeTabEntity(name: '后端开发'),
    HomeTabEntity(name: '人工智能'),
    HomeTabEntity(name: '开发工具'),
    HomeTabEntity(name: '大数据'),
    HomeTabEntity(name: '代码精选'),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: homeTabEntityList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              pinned: true,
              expandedHeight: AppConstant.kAppExpandedHeight,
              collapsedHeight: AppConstant.kAppToolbarHeight,
              toolbarHeight: AppConstant.kAppToolbarHeight,
              title: Container(
                color: Colors.amber,
                width: 100,
                height: AppConstant.kAppToolbarHeight,
                alignment: Alignment.center,
                child: const Text('title', textAlign: TextAlign.center),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(color: Colors.white),
                    Positioned(
                      top: 0,
                      bottom: AppConstant.kAppToolbarHeight,
                      left: 0,
                      right: 0,
                      child: ImageUtils.buildPngWidget(ResImage.kIcBackground, boxFit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
              bottom: HomeTabBar(
                  tabs: homeTabEntityList.map((e) {
                    return Tab(child: Text(e.name));
                  }).toList(),
                  controller: tabController),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: tabController,
        children: homeTabEntityList.map((e) {
          return HomeTabView(entity: e);
        }).toList(),
      ),
    );
  }
}
