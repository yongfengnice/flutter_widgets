import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';

/// @author：yongfeng
/// @data：2024/7/25 10:33
///
class SmartPage extends StatelessWidget {
  ///
  const SmartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('智能'),
      bodyWidget: SegmentedButton<int>(
        style: SegmentedButton.styleFrom(
          foregroundColor: Colors.black,
          selectedForegroundColor: Colors.white,
          backgroundColor: Colors.amber,
          selectedBackgroundColor: Colors.red,
        ),
        segments: const <ButtonSegment<int>>[
          ButtonSegment<int>(
            value: 0,
            label: Text('0'),
            icon: Icon(Icons.calendar_view_day),
          ),
          ButtonSegment<int>(
            value: 1,
            label: Text('1'),
            icon: Icon(Icons.calendar_view_week),
          ),
        ],
        selected: const <int>{0},
        onSelectionChanged: (Set<int> selection) {},
      ),
    );
  }
}
