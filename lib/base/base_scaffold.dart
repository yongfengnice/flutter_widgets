import 'package:flutter/material.dart';

/// @author：yongfeng
/// @data：2024/7/30 9:40
///
class BaseScaffold extends StatelessWidget {
  ///
  final Widget? titleWidget;

  final Widget? bodyWidget;

  ///
  const BaseScaffold({super.key, this.titleWidget, this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleWidget,
      ),
      body: bodyWidget,
    );
  }
}
