import 'dart:async';

import 'package:flutter/material.dart';

import 'banner_indicator.dart';

/// @author：yongfeng
/// @data：2024/8/6 16:06
///
class BannerWidget extends StatefulWidget {
  final TabController? tabController;
  final List<Widget> children;
  final BannerIndicator bannerIndicator;

  const BannerWidget({
    super.key,
    required this.children,
    required this.bannerIndicator,
    this.tabController,
  });

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  double indicatorSize = 20;
  double indicatorPadding = 10;
  double tabBarWidget = 0;

  double? indicatorLeft = 0;
  double? indicatorRight = 0;

  final List<Tab> tabList = [];
  bool showNumber = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _tabController =
        widget.tabController ?? TabController(length: widget.children.length, vsync: this);
    indicatorSize = widget.bannerIndicator.indicatorSize;
    indicatorPadding = widget.bannerIndicator.indicatorPadding;
    tabBarWidget = (indicatorSize + indicatorPadding * 2) * widget.children.length;

    if (widget.bannerIndicator.positionType == BannerIndicator.bottomLeft) {
      indicatorLeft = widget.bannerIndicator.indicatorLeft;
      indicatorRight = null;
    } else if (widget.bannerIndicator.positionType == BannerIndicator.bottomRight) {
      indicatorLeft = null;
      indicatorRight = widget.bannerIndicator.indicatorRight;
    }
    showNumber = widget.bannerIndicator.showNumber;
    _intTabList();
    _initTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _initTime() {
    _timer?.cancel();
    if (widget.bannerIndicator.autoPlay) {
      _timer = Timer.periodic(const Duration(milliseconds: 3000), (timer) {
        if (_tabController.index == _tabController.length - 1) {
          _tabController.index = 0;
        } else {
          _tabController.index = _tabController.index + 1;
        }
      });
    }
  }

  void _intTabList() {
    for (int i = 0; i < widget.children.length; ++i) {
      tabList.add(
        Tab(
          iconMargin: EdgeInsets.zero,
          height: indicatorSize,
          child: Container(
            alignment: Alignment.center,
            width: indicatorSize,
            height: indicatorSize,
            decoration: BoxDecoration(
              color: widget.bannerIndicator.circleBackground,
              borderRadius: BorderRadius.circular(indicatorSize / 2),
              border: Border.all(color: widget.bannerIndicator.circleColor),
            ),
            child: showNumber ? Text('${i + 1}', textAlign: TextAlign.center) : null,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(color: Colors.white),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: widget.bannerIndicator.containerBottom,
          child: TabBarView(
            controller: _tabController,
            children: widget.children,
          ),
        ),
        Positioned(
          bottom: widget.bannerIndicator.indicatorBottom,
          left: indicatorLeft,
          right: indicatorRight,
          child: Container(
            width: tabBarWidget,
            height: indicatorSize,
            alignment: Alignment.center,
            child: TabBar(
              tabs: tabList,
              controller: _tabController,
              dividerHeight: 0,
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.symmetric(horizontal: indicatorPadding),
              indicatorWeight: 0,
              tabAlignment: TabAlignment.center,
              indicator: BoxDecoration(
                color: widget.bannerIndicator.indicatorColor,
                borderRadius: BorderRadius.circular(indicatorSize / 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
