import 'dart:async';

import 'package:flutter/foundation.dart';

/// @author：yongfeng
/// @data：2024/9/9 15:28
/// Isolate工具
class IsolateUtils {
  IsolateUtils._internal();

  factory IsolateUtils() {
    return instance;
  }

  /// 单例
  static IsolateUtils instance = IsolateUtils._internal();

  void executeInIsolate<M, R>(
      ComputeCallback<M, R> isolateFunc, M isolateParam, ValueChanged<R?> callback) {
    compute(isolateFunc, isolateParam, debugLabel: 'executeInIsolate')
        .then((value) => callback(value))
        .onError((error, stackTrace) {
      debugPrint("executeInIsolate error1:${error.toString()}");
      // debugPrint("executeInIsolate error2:${stackTrace.toString()}");
      callback(null);
    });
  }
}
