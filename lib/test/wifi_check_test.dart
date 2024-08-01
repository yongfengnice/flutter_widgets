import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';

/// @author：yongfeng
/// @data：2024/8/1 19:06
///
class WifiCheckTest extends StatefulWidget {
  const WifiCheckTest({super.key});

  @override
  State<WifiCheckTest> createState() => _WifiCheckTestState();
}

class _WifiCheckTestState extends State<WifiCheckTest> {
  StreamSubscription<List<ConnectivityResult>>? subscription;

  String netType = 'unknown';

  @override
  void initState() {
    super.initState();
    subscription =
        Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        netType = 'mobile';
        setState(() {});
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        netType = 'wifi';
        setState(() {});
      } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
        netType = 'ethernet';
        setState(() {});
      } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
        netType = 'vpn';
        setState(() {});
      } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
        netType = 'bluetooth';
        setState(() {});
      } else if (connectivityResult.contains(ConnectivityResult.other)) {
        netType = 'other';
        setState(() {});
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        netType = 'none';
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('网络类型判断'),
      bodyWidget: Center(
        child: Text('当前网络类型：$netType'),
      ),
    );
  }
}
