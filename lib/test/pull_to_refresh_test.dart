import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// @author：yongfeng
/// @data：2024/9/4 18:20
/// 下拉刷新上拉加载更多测试
class PullToRefreshTest extends StatefulWidget {
  const PullToRefreshTest({super.key});

  @override
  State<PullToRefreshTest> createState() => _PullToRefreshTestState();
}

class _PullToRefreshTestState extends State<PullToRefreshTest> {
  List<String> items = [];

  final RefreshController _refreshController = RefreshController(initialRefresh: true);

  /// 滚动控制器
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    //上拉加载更多触发距离默认15
    if (_scrollController.position.maxScrollExtent - _scrollController.position.pixels < 20) {
      if (_scrollController.position.maxScrollExtent - _scrollController.position.pixels > 15) {
        if (_refreshController.footerMode?.value == LoadStatus.canLoading) {
          debugPrint("上拉加载更多：${_scrollController.position.pixels}");
          _refreshController.loadComplete();
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  StatefulElement? _findIndicator(BuildContext context) {
    StatefulElement? result;
    context.visitChildElements((Element e) {
      debugPrint("visitChildElements==${e.widget.toString()}");
      if (e.widget is SmartRefresher) {
        result = e as StatefulElement?;
      }
      result ??= _findIndicator(e);
    });
    return result;
  }

  void _setCanDragOnRefresh(bool cansDrag) {
    (_findIndicator(context)?.state as SmartRefresherState).setCanDrag(cansDrag);
  }

  void _onRefresh() async {
    _setCanDragOnRefresh(false);
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 2000));
    // if failed,use refreshFailed()
    items.clear();
    items.addAll(["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]);
    _refreshController.refreshCompleted();
    _refreshController.footerMode?.value = LoadStatus.idle;
    debugPrint("_onRefresh222222");
    if (mounted) {
      setState(() {});
      _setCanDragOnRefresh(true);
    }
  }

  void _onLoading() async {
    if (_refreshController.isRefresh) {
      _refreshController.loadComplete();
      return;
    }
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 2000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    for (int i = 0; i < 10; i++) {
      items.add((items.length + 1).toString());
    }
    if (mounted) setState(() {});
    if (items.length >= 60) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

  bool isPc() {
    return Platform.isMacOS || Platform.isLinux || Platform.isWindows || Platform.isFuchsia;
  }

  Widget buildBodyWidget() {
    return SmartRefresher(
      scrollController: _scrollController,
      enablePullDown: true,
      enablePullUp: true,
      header: const MaterialClassicHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = InkWell(
              onTap: () {
                if (isPc()) {
                  _refreshController.requestLoading();
                }
              },
              child: Text(isPc() ? "点击加载更多" : "上拉加载更多"),
            );
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("加载更多失败请点击重试");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("松开加载更多");
          } else {
            body = const Text("没有更多数据了");
          }
          return SizedBox(height: 55.0, child: Center(child: body));
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
        itemExtent: 100.0,
        itemCount: items.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('下拉刷新上拉加载更多测试'),
      bodyWidget: buildBodyWidget(),
    );
  }
}
