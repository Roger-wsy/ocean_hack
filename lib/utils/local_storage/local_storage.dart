import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void storeItemInLocalStorage(String key, dynamic value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (value is Map<String, dynamic>) {
    value = json.encode(value);
  }
  await prefs.setString(key, value);
}

Future<dynamic> getItemFromLocalStorage(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? value = prefs.getString(key);

  return value;
}

void removeItemFromLocalStorage(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}
