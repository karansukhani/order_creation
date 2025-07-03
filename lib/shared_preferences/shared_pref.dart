import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<String> getString(String key, {String defaultValue = ""}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defaultValue;
  }

  static setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
