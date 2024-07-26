import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// @author：yongfeng
/// @data：2024/7/25 12:03
///
class ImageLoader {
  ///工厂构造函数
  factory ImageLoader() {
    return instance;
  }

  /// 单例
  static ImageLoader instance = ImageLoader._internal();

  ///构造函数私有化
  ImageLoader._internal();

  ///单独新建一个对象，与ImageLoader._internal单例区分
  ImageLoader.single();

}
