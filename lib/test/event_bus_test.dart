import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';

/// @author：yongfeng
/// @data：2024/9/22 17:15
/// eventbus使用测试
class EventBusTest extends StatefulWidget {
  const EventBusTest({super.key});

  @override
  State<EventBusTest> createState() => _EventBusTestState();
}

class _EventBusTestState extends State<EventBusTest> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('eventbus使用测试'),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          const Text('eventbus使用测试'),
          TextButton(onPressed: () {}, child: const Text('发送事件')),
        ],
      ),
    );
  }
}
