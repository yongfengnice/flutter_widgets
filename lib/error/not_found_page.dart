import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:flutter_widgets/router/app_router.dart';

/// @author：yongfeng
/// @data：2024/7/30 9:56
///
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('页面出错了'),
      bodyWidget: Center(
        child: TextButton(
          onPressed: () {
            AppRouter().pop(context);
          },
          child: const Text('点击返回'),
        ),
      ),
    );
  }
}
