import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';

/// @author：yongfeng
/// @data：2024/9/22 17:15
/// eventbus使用测试
class EventBusTest extends StatefulWidget {
  const EventBusTest({super.key});

  @override
  State<EventBusTest> createState() => _EventBusTestState();
}

class _EventBusTestState extends State<EventBusTest> with EventBusMixin {
  int count = 0;
  String name = "";

  @override
  void initState() {
    super.initState();
    onEvent((event) => debugPrint('event fired:  ${event.runtimeType}'));

    onEvent<UserLoggedInEvent>((event) {
      name = event.name;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('eventbus使用测试'),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          const Text('eventbus使用测试'),
          TextButton(
              onPressed: () {
                eventBus.fire(UserLoggedInEvent('zhangsan${count++}'));
              },
              child: const Text('发送事件')),
          Text('收到事件:$name'),
        ],
      ),
    );
  }
}

EventBus eventBus = EventBus();

mixin EventBusMixin<S extends StatefulWidget> on State<S> {
  final List<StreamSubscription<dynamic>> _listeners = <StreamSubscription<dynamic>>[];

  void onEvent<T>(void Function(T event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    final ss = eventBus
        .on<T>()
        .listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    _listeners.add(ss);
  }

  void sendEvent(event) {
    eventBus.fire(event);
  }

  @override
  void dispose() {
    _listeners
      ..forEach((StreamSubscription<dynamic> it) => it.cancel())
      ..clear();
    debugPrint("_listeners=${_listeners.length}");
    super.dispose();
  }
}

class UserLoggedInEvent {
  String name;

  UserLoggedInEvent(this.name);
}
