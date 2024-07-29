import 'package:flutter/material.dart';
import 'package:flutter_widgets/constant/app_constants.dart';
import 'package:flutter_widgets/resouce/resource_image.dart';
import 'package:flutter_widgets/utils/image_utils.dart';

/// @author：yongfeng
/// @data：2024/7/29 17:20
///
class NestScrollViewTest extends StatelessWidget {
  const NestScrollViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const NestedScrollViewExample();
  }
}

class NestedScrollViewExample extends StatelessWidget {
  const NestedScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Tab 1', 'Tab 2'];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('Books'),
                  // This is the title in the app bar.
                  pinned: true,
                  expandedHeight: 200.0,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Container(color: Colors.white),
                        Positioned(
                          top: 0,
                          bottom: AppConstant.kAppToolbarHeight,
                          left: 0,
                          right: 0,
                          child: ImageUtils.buildPngWidget(ResImage.kIcBackground,
                              boxFit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                  bottom: TabBar(
                    tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 48.0,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
