import 'package:flutter/material.dart';

import 'banner_indicator.dart';
import 'banner_widget.dart';

/// @author：yongfeng
/// @data：2024/8/7 10:13
///
class ImageBanner extends StatelessWidget {
  final List<String> imageList;
  final bool? autoPlay;
  final int? positionType;
  final bool? showNumber;
  final double? indicatorSize;
  final ValueChanged<String>? imageClick;

  const ImageBanner({
    super.key,
    required this.imageList,
    this.autoPlay,
    this.positionType,
    this.showNumber,
    this.indicatorSize,
    this.imageClick,
  });

  @override
  Widget build(BuildContext context) {
    return BannerWidget(
      bannerIndicator: BannerIndicator()
        ..autoPlay = autoPlay ?? false
        ..positionType = positionType ?? BannerIndicator.bottomCenter
        ..showNumber = showNumber ?? false
        ..indicatorSize = indicatorSize ?? ((showNumber ?? false) ? 20 : 10),
      children: imageList.map((e) {
        return InkWell(
          onTap: () {
            imageClick?.call(e);
          },
          child: Image.network(e, fit: BoxFit.cover),
        );
      }).toList(),
    );
  }
}
