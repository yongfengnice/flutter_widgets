import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';

/// @author：yongfeng
/// @data：2024/9/22 9:59
/// TapRegion实现自定义Toast
class TapRegionTest extends StatefulWidget {
  const TapRegionTest({super.key});

  @override
  State<TapRegionTest> createState() => _TapRegionTestState();
}

class _TapRegionTestState extends State<TapRegionTest> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('TapRegion实现自定义Toast'),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          TextButton(
            onPressed: () {},
            child: const Text('点击测试弹出Toast'),
          ),
          const Text('TapRegion实现自定义Toast'),
        ],
      ),
    );
  }
}
