import 'package:flutter/material.dart';

/// @author：yongfeng
/// @data：2024/8/6 16:27
///
class BannerIndicator {
  static const int bottomLeft = 1;
  static const int bottomCenter = 2;
  static const int bottomRight = 3;

  double indicatorSize = 10;
  Color indicatorColor = Colors.green;
  double indicatorPadding = 10;

  Color circleBackground = Colors.transparent;
  Color circleColor = Colors.amber;

  int positionType = bottomCenter;
  double indicatorLeft = 10;
  double indicatorTop = 10;
  double indicatorRight = 10;
  double indicatorBottom = 10;

  double containerBottom = 0;
  bool showNumber = false;
  bool autoPlay = false;
}
