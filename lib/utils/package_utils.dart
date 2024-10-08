import 'package:package_info_plus/package_info_plus.dart';

/// @author：yongfeng
/// @data：2024/8/18 14:51
///
class PackageUtils {
  PackageUtils._internal();

  //length==5
  static Future<List<String>> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    String buildSignature = packageInfo.buildSignature;
    return [appName, packageName, version, buildNumber, buildSignature];
  }
}
