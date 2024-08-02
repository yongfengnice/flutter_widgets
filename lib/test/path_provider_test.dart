import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';

/// @author：yongfeng
/// @data：2024/8/2 10:25
/// 文件路径操作测试
/// Directories support by platform:
//
// Directory	                  Android	iOS	Linux	macOS	Windows
// Temporary	                      ✔️	✔️	  ✔️	  ✔️	  ✔️
// Application Support	            ✔️	✔️	  ✔️	  ✔️	  ✔️
// Application Library	            ❌️	✔️	  ❌️	  ✔️  	❌️
// Application Documents	          ✔️	✔️	  ✔️  	✔️  	✔️
// Application Cache	              ✔️	✔️	  ✔️  	✔️  	✔️
// External Storage	                ✔️	❌   	❌	  ❌️  	❌️
// External Cache Directories	      ✔️	❌	  ❌	  ❌️  	❌️
// External Storage Directories   	✔️	❌	  ❌	  ❌️	  ❌️
// Downloads	                      ✔️	✔️	  ✔️	  ✔️  	✔️
class PathProviderTest extends StatefulWidget {
  const PathProviderTest({super.key});

  @override
  State<PathProviderTest> createState() => _PathProviderTestState();
}

class _PathProviderTestState extends State<PathProviderTest> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: Text('文件路径操作测试'),
      bodyWidget: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('文件路径操作测试:'),
            const SizedBox(height: 20),
            FutureBuilder(
              future: getTemporaryDirectory(),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Text('Temporary目录路径:${snapshot.data?.path}'),
                    TextButton(
                      onPressed: () {
                        File('${snapshot.data?.path}/test.txt').writeAsStringSync('hello world');
                      },
                      child: const Text('点击写入hello world到Temporary目录下test.txt'),
                    ),
                    TextButton(
                      onPressed: () {
                        final text = File('${snapshot.data?.path}/test.txt').readAsStringSync();
                        showToast('$text${index++}');
                      },
                      child: const Text('从Temporary目录下test.txt读取hello world'),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: getApplicationSupportDirectory(),
              builder: (context, snapshot) {
                return Text('Application Support目录路径:${snapshot.data?.path}');
              },
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: getApplicationDocumentsDirectory(),
              builder: (context, snapshot) {
                return Text('Application Documents目录路径:${snapshot.data?.path}');
              },
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: getApplicationCacheDirectory(),
              builder: (context, snapshot) {
                return Text('Application Cache目录路径:${snapshot.data?.path}');
              },
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: getDownloadsDirectory(),
              builder: (context, snapshot) {
                return Text('Downloads目录路径:${snapshot.data?.path}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
