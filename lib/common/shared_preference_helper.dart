import 'package:shared_preferences/shared_preferences.dart';

Future<T> getPreferenceValue<T>(String key, T defaultValue) async {
  T value;
  SharedPreferences preferences = await SharedPreferences.getInstance();

  if (!preferences.containsKey(key)) return Future.value(defaultValue);

  if (defaultValue is int) {
    value = preferences.getInt(key) as T;
  } else if (defaultValue is bool) {
    value = preferences.getBool(key) as T;
  } else if (defaultValue is double) {
    value = preferences.getDouble(key) as T;
  } else {
    value = preferences.getString(key) as T;
  }
  return value;
}

Future<bool> savePreferenceValue<T>(String key, T value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isSaved = false;
  if (value is String) {
    isSaved = await preferences.setString(key, value);
  } else if (value is bool)
    isSaved = await preferences.setBool(key, value);
  else if (value is int)
    isSaved = await preferences.setInt(key, value);
  else if (value is double) isSaved = await preferences.setDouble(key, value);
  return Future.value(isSaved);
}

Future<bool> removeSharedPreferenceKey(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isRemoved = await preferences.remove(key);
  return Future.value(isRemoved);
}

Future<bool> deleteAllTheSharedPreference() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.clear();
}

Future<bool> deleteTheSharedPreference(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.remove(key);
}

// Function to save boolean value
Future<void> saveBooleanToPrefs(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('myBooleanKey', value);
}
// Function to retrieve boolean value
Future<bool> getBooleanFromPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('myBooleanKey') ?? false; // Return false if the value doesn't exist
}
