import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:flutter_widgets/utils/package_utils.dart';

/// @author：yongfeng
/// @data：2024/8/18 14:48
///
class PackageInfoTest extends StatefulWidget {
  const PackageInfoTest({super.key});

  @override
  State<PackageInfoTest> createState() => _PackageInfoTestState();
}

class _PackageInfoTestState extends State<PackageInfoTest> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('获取包信息测试'),
      bodyWidget: FutureBuilder(
        future: PackageUtils.getPackageInfo(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final infoLost = snapshot.data ?? List.filled(5, '');
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('appName:${infoLost[0]}'),
                  const SizedBox(height: 10),
                  Text('packageName:${infoLost[1]}'),
                  const SizedBox(height: 10),
                  Text('version:${infoLost[2]}'),
                  const SizedBox(height: 10),
                  Text('buildNumber:${infoLost[3]}'),
                  const SizedBox(height: 10),
                  Text('buildSignature:${infoLost[4]}'),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
