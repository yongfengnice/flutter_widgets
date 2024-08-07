import 'package:flutter/material.dart';
import 'package:flutter_widgets/router/app_route_settings.dart';
import 'package:flutter_widgets/router/app_router.dart';
import 'package:flutter_widgets/widgets/banner/banner_indicator.dart';
import 'package:flutter_widgets/widgets/banner/banner_widget.dart';

/// @author：yongfeng
/// @data：2024/8/6 12:39
///
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BannerWidget(
      bannerIndicator: BannerIndicator()
        ..indicatorBottom = 60
        ..containerBottom = 0
        ..indicatorSize = 10
        ..positionType = BannerIndicator.bottomCenter,
      children: [
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.deepPurple),
        Container(
          color: Colors.orange,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  AppRouter.instance.popAndPushNamed(context, AppRouteParam.mainPage);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: const Text('开始体验'),
                ),
              ),
              const SizedBox(height: 130)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStartButton() {
    return InkWell(
      onTap: () {},
      child: Container(),
    );
  }
}
