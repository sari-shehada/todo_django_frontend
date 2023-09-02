import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  SharedPrefsService({required this.prefs});
  final SharedPreferences prefs;

  static late final SharedPrefsService instance;

  static Future<SharedPrefsService> init() async {
    final SharedPreferences prefsInstance =
        await SharedPreferences.getInstance();

    instance = SharedPrefsService(
      prefs: prefsInstance,
    );

    return instance;
  }

  int? getInt(String key) {
    return instance.getInt(key);
  }

  Future<bool> setInt(String key, int value) async {
    try {
      return await instance.setInt(key, value).then((value) => true);
    } catch (e) {
      return false;
    }
  }

  String? getString(String key) {
    return instance.getString(key);
  }

  Future<bool> setString(String key, String value) async {
    try {
      return await instance.setString(key, value).then((value) => true);
    } catch (e) {
      return false;
    }
  }
}
