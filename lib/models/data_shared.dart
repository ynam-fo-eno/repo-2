// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable

import 'package:shared_preferences/shared_preferences.dart';

class Prefs {

  Future addStringToSF(String key,String value) async {
    SharedPreferences prefs=  await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

   Future<String?> getStringValueSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final image= prefs.getString(key);
    return image;
  }

  Future addBooleanToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
  
}