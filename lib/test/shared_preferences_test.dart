import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:flutter_widgets/utils/prefs_utils.dart';
import 'package:oktoast/oktoast.dart';

/// @author：yongfeng
/// @data：2024/8/18 18:04
///
class SharedPreferencesTest extends StatefulWidget {
  const SharedPreferencesTest({super.key});

  @override
  State<SharedPreferencesTest> createState() => _SharedPreferencesTestState();
}

class _SharedPreferencesTestState extends State<SharedPreferencesTest> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('SharedPreferences数据存储测试'),
      bodyWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () async {
                await PrefsUtils.instance.putString('test_key', 'test_value');
                showToast("保存'test_value'成功");
              },
              child: const Text('putString test_value'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                showToast('${await PrefsUtils.instance.getString('test_key')}');
              },
              child: const Text('getString'),
            ),
          ],
        ),
      ),
    );
  }
}
