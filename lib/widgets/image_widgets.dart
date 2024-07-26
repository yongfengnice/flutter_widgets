import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// @author：yongfeng
/// @data：2024/7/25 12:13
///

/// 资源存放位置
const String resourceHost = 'packages/flutter_widgets/';

/// svg图片
Widget buildSvgWidget(String svgPath, {double? width, double? height, Color? color}) {
  return SvgPicture.asset(
    svgPath,
    width: width ?? 20,
    height: height ?? 20,
    color: color,
  );
}

///png图片
Widget buildPngWidget(String pngPath, {double? width, double? height, Color? color}) {
  return Image.asset(
    pngPath,
    width: width ?? 20,
    height: height ?? 20,
    color: color,
  );
}
