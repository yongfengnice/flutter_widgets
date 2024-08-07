import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:flutter_widgets/widgets/banner/image_banner.dart';
import 'package:oktoast/oktoast.dart';

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
      bodyWidget: Column(
        children: [
          SizedBox(
            height: 160,
            child: ImageBanner(
              autoPlay: true,
              imageList: const [
                'https://img1.baidu.com/it/u=3518673092,2032183538&fm=253&fmt=auto&app=138&f=JPEG?w=781&h=500',
                'https://img1.baidu.com/it/u=728576857,3157099301&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313',
                'https://img0.baidu.com/it/u=2891604792,4085341318&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=333',
                'https://img0.baidu.com/it/u=3312603872,2552024421&fm=253&fmt=auto&app=120&f=JPEG?w=972&h=547',
                'https://img1.baidu.com/it/u=328002743,1511633109&fm=253&fmt=auto&app=138&f=JPEG?w=751&h=500',
              ],
              imageClick: (path) {
                showToast('path:$path');
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text('index=$index'),
                );
              },
              itemCount: 101,
            ),
          )
        ],
      ),
    );
  }
}
