import 'package:flutter/material.dart';
import 'package:flutter_widgets/entity/bottom_tab_entity.dart';
import 'package:flutter_widgets/utils/image_utils.dart';

/// @author：yongfeng
/// @data：2024/7/25 11:50

class BottomTabWidget extends StatelessWidget {
  final ValueNotifier<int> selectedNotifier;
  final ValueChanged<int> itemClick;
  final List<BottomTabEntity> tabBeanList;

  const BottomTabWidget({
    super.key,
    required this.selectedNotifier,
    required this.tabBeanList,
    required this.itemClick,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedNotifier,
      builder: (BuildContext context, int value, Widget? child) {
        final widgetList = tabBeanList
            .map((e) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      itemClick.call(e.itemIndex);
                    },
                    child: BottomTabItemWidget(
                      selected: value == e.itemIndex,
                      itemImage: e.itemImage,
                      itemText: e.itemText,
                    ),
                  ),
                ))
            .toList();
        return BottomAppBar(
          height: 48,
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widgetList,
          ),
        );
      },
    );
  }
}

///bottom tab item
class BottomTabItemWidget extends StatelessWidget {
  final bool selected;
  final String itemImage;
  final String itemText;

  ///
  const BottomTabItemWidget(
      {super.key, required this.itemImage, required this.itemText, required this.selected});

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.blue : Colors.black;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageUtils.buildSvgWidget(itemImage, color: color),
        Text(
          itemText,
          textAlign: TextAlign.center,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
