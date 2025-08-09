import 'package:ecomerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  ThemeMode get currentTheme => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  ThemeProvider() {
    //_loadTheme();
  }

  void toggleTheme(bool value) async {
    _isDarkMode = value;
    notifyListeners();
    // final prefs = await SharedPreferences.getInstance();
    // prefs.setBool('isDarkMode', _isDarkMode);
  }

  // Future<void> _loadTheme() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey('isDarkMode')) {
  //     _isDarkMode = prefs.getBool('isDarkMode')!;
  //   } else {
  //     _isDarkMode = true;
  //   }
  //   notifyListeners();
  // }

  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    primaryColor: AppColors.primary,
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,

      elevation: 0,
    ),
    textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black)),
  );

  ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    primaryColor: AppColors.primary,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
  );
}
