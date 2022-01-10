import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  static SharedPreferences? _prefs;

  Future clearPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!.clear();
  }

  Future remove(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!.remove(key);
  }

  //saving any string with key and its value
  Future<void> setStringValue(String key, String value) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.setString(key, value);
  }

  //getting any saved string with its key
  Future<String> getStringValue(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!.getString(key) ?? '';
  }

  Future<List<String>> getStringListValue(String key) async {
    _prefs ??= await SharedPreferences.getInstance();

    return _prefs!.getStringList(key) ?? List<String>.empty();
  }

  Future<void> setStringListValue(String key, List<String> value) async {
    _prefs ??= await SharedPreferences.getInstance();

    await _prefs!.setStringList(key, value);
  }

  //saving any string with key and its value
  Future<void> setBoolValue(String key, bool value) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.setBool(key, value);
  }

  //getting any saved string with its key
  Future<double?> getDoubleValue(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    if (_prefs!.getString(key) == null) {
      return null;
    } else {
      return double.tryParse(_prefs!.getString(key)!);
    }
  }

  //saving any string with key and its value
  Future<void> setDoubleValue(String key, double value) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.setString(key, value.toString());
  }

  //getting any saved string with its key
  Future<bool> getBoolValue(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!.getBool(key) ?? false;
  }

  Future<bool?> getBoolValueOrNull(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!.getBool(key);
  }
}
