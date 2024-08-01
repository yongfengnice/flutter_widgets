import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:flutter_widgets/widgets/dash/dash_decoration.dart';

/// @author：yongfeng
/// @data：2024/7/30 9:36
///
class DashLineTest extends StatelessWidget {
  const DashLineTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('虚线测试'),
      bodyWidget: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(30),
            height: 80,
            decoration: const DashDecoration(dashColor: Colors.grey),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            height: 80,
            decoration: const DashDecoration(
                dashColor: Colors.amber, step: 10, span: 8, radius: Radius.circular(10)),
          )
        ],
      ),
    );
  }
}
