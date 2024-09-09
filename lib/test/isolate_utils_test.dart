import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:flutter_widgets/utils/isolate_utils.dart';

/// @author：yongfeng
/// @data：2024/9/6 10:16
/// isolate工具测试
class IsolateUtilsTest extends StatefulWidget {
  const IsolateUtilsTest({super.key});

  @override
  State<IsolateUtilsTest> createState() => _IsolateUtilsTestState();
}

class _IsolateUtilsTestState extends State<IsolateUtilsTest> {
  final mainIsolateName = "Main-Isolate";

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('isolate工具测试'),
      bodyWidget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                debugPrint("mainFunc_exec_start");
                IsolateUtils.instance.executeInIsolate(
                    (message) {
                      debugPrint("isolateFunc exec start!!!");
                      //模拟3秒耗时操作，这个匿名方法在子隔离区运行，能访问该匿名方法的方法参数message
                      return Future.delayed(const Duration(milliseconds: 3000), () {
                        String result = "data from inner method param (success):$message";
                        debugPrint("isolateFunc exec end!!!");
                        return result;
                      });
                    },
                    "isolateFunc_exec_param",
                    (value) {
                      debugPrint("isolateFunc_exec_result:$value");
                      debugPrint("mainFunc_exec_end!!!");
                    });
              },
              child: const Text('isolate工具测试1-正确使用(能访问自己隔离区内的参数)'),
            ),
            //===============================================================================================
            TextButton(
              onPressed: () {
                debugPrint("mainFunc_exec_start");
                IsolateUtils.instance.executeInIsolate(
                    (message) {
                      debugPrint("isolateFunc exec start!!!");
                      //模拟3秒耗时操作，这个匿名方法在子隔离区运行，能访问该匿名方法的临时变量execIsolateName
                      const execIsolateVariable = "execIsolateVariable";
                      return Future.delayed(const Duration(milliseconds: 3000), () {
                        String result =
                            "data from inner method variable (success):$execIsolateVariable";
                        debugPrint("isolateFunc exec end!!!");
                        return result;
                      });
                    },
                    "isolateFunc_exec_param",
                    (value) {
                      debugPrint("isolateFunc_exec_result:$value");
                      debugPrint("mainFunc_exec_end!!!");
                    });
              },
              child: const Text('isolate工具测试2-正确使用(能访问自己隔离区内的变量)'),
            ),
            //===============================================================================================
            TextButton(
              onPressed: () {
                debugPrint("mainFunc_exec_start");
                IsolateUtils.instance.executeInIsolate(
                    (message) {
                      debugPrint("isolateFunc exec start!!!");
                      //模拟3秒耗时操作，这个匿名方法在子隔离区运行，不能访问该匿名方法之外的任何变量，否则报错
                      //Invalid argument(s): Illegal argument in isolate message: object is unsendable
                      return Future.delayed(const Duration(milliseconds: 3000), () {
                        //访问了主隔离区的mainIsolateName变量，导致`object is unsendable`报错
                        String result = "get main isolate name (error):$mainIsolateName";
                        debugPrint("isolateFunc exec end!!!");
                        return result;
                      });
                    },
                    "isolateFunc_exec_param",
                    (value) {
                      debugPrint("isolateFunc_exec_result:$value");
                      debugPrint("mainFunc_exec_end!!!");
                    });
              },
              child: const Text('isolate工具测试3-错误使用(不能访问其他隔离区的变量)'),
            ),
            //===============================================================================================
            TextButton(
              onPressed: () {
                debugPrint("mainFunc_exec_start");
                IsolateUtils.instance.executeInIsolate(
                    (message) {
                      debugPrint("isolateFunc exec start!!!");
                      return Future.delayed(const Duration(milliseconds: 3000), () {
                        String result = "data from inner method param (success):${message.name}";
                        debugPrint("isolateFunc exec end!!!");
                        return IsolateTestResult(result);
                      });
                    },
                    IsolateTestParam('isolateFunc_exec_param'),
                    (value) {
                      debugPrint("isolateFunc_exec_result:${value?.name}");
                      debugPrint("mainFunc_exec_end!!!");
                    });
              },
              child: const Text('isolate工具测试4-正确使用(不同隔离区之间能传递对象)'),
            ),
          ],
        ),
      ),
    );
  }
}

class IsolateTestParam {
  String name;

  IsolateTestParam(this.name);
}

class IsolateTestResult {
  String name;

  IsolateTestResult(this.name);
}
