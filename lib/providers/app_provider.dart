import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restraunt/util/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    checkTheme();
  }

  ThemeData _theme = Constants.lightTheme;
  Key _key = UniqueKey();
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  ThemeData get theme => _theme;
  Key get key => _key;
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  void setKey(Key value) {
    _key = value;
    notifyListeners();
  }

  void setNavigatorKey(GlobalKey<NavigatorState> value) {
    _navigatorKey = value;
    notifyListeners();
  }

  void setTheme(ThemeData value, String themeName) async {
    _theme = value;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", themeName);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          themeName == "dark" ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness:
          themeName == "dark" ? Brightness.light : Brightness.dark,
    ));
  }

  Future<void> checkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeName = prefs.getString("theme");

    if (themeName == null || themeName == "light") {
      _theme = Constants.lightTheme;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Constants.lightPrimary,
        statusBarIconBrightness: Brightness.dark,
      ));
    } else {
      _theme = Constants.darkTheme;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Constants.darkPrimary,
        statusBarIconBrightness: Brightness.light,
      ));
    }

    notifyListeners();
  }
}
