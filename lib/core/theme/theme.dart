import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static  _border([Color color=AppPallete.borderColor])=> OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(color:color,width: 3)
      );
  static final darkThemeMode=ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppPallete.backgroundColor
    ),
    chipTheme: ChipThemeData(
      color: WidgetStatePropertyAll(AppPallete.backgroundColor),
      side: BorderSide.none
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder:_border(AppPallete.gradient2) ,
      errorBorder: _border(AppPallete.errorColor)
      ), 
    );
   
      
}