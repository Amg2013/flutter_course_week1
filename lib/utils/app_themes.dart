import 'package:flutter/material.dart';
import 'package:iti_project/utils/app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF673AB7)),
    appBarTheme: AppBarTheme(
      color: AppColors.appbarLightColor,
      elevation: 20,
      centerTitle: true,
      shadowColor: Color(0xFF673AB7),
    ),

    textTheme: TextTheme(bodySmall: TextStyle(color: AppColors.whiteApp)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.secnderyColor,
        //  alignment: Alignment.bottomCenter,
        textStyle: TextStyle(color: Colors.blueAccent),
      ),
    ),

    brightness: Brightness.light,
    // scaffoldBackgroundColor: AppColors.whiteBloc,
    useMaterial3: true,
  );
}
