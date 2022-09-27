import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static const String sUrl = "sUrlXI";

  static String url = "";

  static void saveData(String key,String value) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString(key, value);
  }

  static Future<String?> getData(String key,String value) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.getString(key);
  }
}