import 'package:shared_preferences/shared_preferences.dart';

/// @author：yongfeng
/// @data：2024/8/18 18:08
///
class PrefsUtils {
  static SharedPreferences? _prefs;

  //工厂构造函数
  factory PrefsUtils() {
    return instance;
  }

  /// 单例
  static PrefsUtils instance = PrefsUtils._internal();

  ///构造函数私有化
  PrefsUtils._internal();

  Future<SharedPreferences> getPrefs() async {
    return _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> putString(String key, String value) async {
    (await getPrefs()).setString(key, value);
  }

  Future<String?> getString(String key, {String? defValue}) async {
    return (await getPrefs()).getString(key) ?? defValue;
  }
}
