import 'package:shared_preferences/shared_preferences.dart';

/// Wrapper class to help make the interaction with SharedPreferences easy
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

  //getting any saved double with its key
  Future<double?> getDoubleValue(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!.getDouble(key);
  }

  //saving any double with key and its value
  Future<void> setDoubleValue(String key, double value) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.setDouble(key, value);
  }

  //getting any saved string with its key
  Future<int?> getIntValue(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!.getInt(key);
  }

  //saving any string with key and its value
  Future<void> setIntValue(String key, int value) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.setInt(key, value);
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
