import 'package:etc/theme/sharedPreference.dart';
import 'package:flutter/material.dart';


class ThemeModel extends ChangeNotifier{
  late bool _isDark;
  late MyThemePreferences _preferences;
  bool get isDark=> _isDark;

  getPreferences() async{
    _isDark =await _preferences.getTheme();
    notifyListeners();

  }

  set isDark(bool value){
    _isDark=value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  ThemeModel(){
    _isDark =false;
    _preferences=MyThemePreferences();
    getPreferences();
    
  }

   

   
}