import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:network_info_plus/network_info_plus.dart';

/// @author：yongfeng
/// @data：2025/6/30 16:23
///
class NetworkInfoPlusTest extends StatefulWidget {
  const NetworkInfoPlusTest({super.key});

  @override
  State<NetworkInfoPlusTest> createState() => _NetworkInfoPlusTestState();
}

class _NetworkInfoPlusTestState extends State<NetworkInfoPlusTest> {
  final NetworkInfo _networkInfo = NetworkInfo();
  String? _connectionStatus = 'Unknown';

  @override
  void initState() {
    super.initState();
    _initNetworkInfo();
  }

  Future<void> _initNetworkInfo() async {
    final connectionStatus = await _networkInfo.getWifiIP();
    debugPrint('Wifi IP: $connectionStatus');
    setState(() {
      _connectionStatus = 'Wifi IP: $connectionStatus';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('网络信息判断'),
      bodyWidget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Network info',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(_connectionStatus ?? 'Unknown'),
          ],
        ),
      ),
    );
  }
}
