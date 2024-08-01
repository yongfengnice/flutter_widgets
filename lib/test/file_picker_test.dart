import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:flutter_widgets/utils/file_utils.dart';

/// @author：yongfeng
/// @data：2024/7/30 15:40
///
class FilePickerTest extends StatefulWidget {
  const FilePickerTest({super.key});

  @override
  State<FilePickerTest> createState() => _FilePickerTestState();
}

class _FilePickerTestState extends State<FilePickerTest> {
  String filePath = "";

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('文件选择测试'),
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: double.infinity),
          TextButton(
              onPressed: () {
                FileUtils.pickImage().then((value) {
                  if (value != null) {
                    filePath = value;
                    setState(() {});
                  }
                });
              },
              child: const Text('点击选择一张图片显示出来')),
          filePath.isEmpty ? const SizedBox() : Image.file(File(filePath), width: 200, height: 320),
        ],
      ),
    );
  }
}
