import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// @author：yongfeng
/// @data：2024/7/25 12:03
///
class ImageUtils {
  // ///工厂构造函数
  factory ImageUtils() {
    return instance;
  }

  /// 单例
  static ImageUtils instance = ImageUtils._internal();

  ///构造函数私有化
  ImageUtils._internal();

  ///单独新建一个对象，与ImageLoader._internal单例区分
  // ImageUtils.single();

  /// 资源存放位置
  static const String resourceHost = 'packages/flutter_widgets/';

  /// svg图片
  static Widget buildSvgWidget(String svgPath, {double? width, double? height, Color? color}) {
    return SvgPicture.asset(
      svgPath,
      width: width ?? 20,
      height: height ?? 20,
      color: color,
    );
  }

  ///png图片
  static Widget buildPngWidget(String pngPath,
      {double? width, double? height, Color? color, BoxFit? boxFit}) {
    return Image.asset(
      pngPath,
      width: width ?? 20,
      height: height ?? 20,
      color: color,
      fit: boxFit,
    );
  }
}
