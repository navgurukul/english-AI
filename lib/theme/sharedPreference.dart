

import 'package:shared_preferences/shared_preferences.dart';

class MyThemePreferences {
  static const theme_key='Theme_key';

  setTheme (bool value) async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setBool(theme_key, value);
  }

  getTheme () async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.getBool(theme_key)?? false;
  }
}