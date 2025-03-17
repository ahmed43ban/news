import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors_manger.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: ColorsManger.primaryLight),
          centerTitle: true,
          color: Colors.transparent,
          actionsIconTheme: IconThemeData(color: ColorsManger.primaryLight),
          iconTheme: IconThemeData(color: ColorsManger.primaryLight)),
      scaffoldBackgroundColor: ColorsManger.backLight,
      colorScheme: ColorScheme.light(
          primary: ColorsManger.primaryLight,
          secondary: ColorsManger.secondaryLight),
      textTheme: TextTheme(
          labelMedium: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManger.primaryLight),
          titleMedium: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManger.primaryLight),
          titleSmall: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManger.primaryLight),
          bodyMedium: TextStyle(
              color: ColorsManger.secondaryLight,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp)));
  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: ColorsManger.primaryDark),
          centerTitle: true,
          color: Colors.transparent,
          actionsIconTheme: IconThemeData(color: ColorsManger.primaryDark),
          iconTheme: IconThemeData(color: ColorsManger.primaryDark)),
      scaffoldBackgroundColor: ColorsManger.backDark,
      colorScheme: ColorScheme.dark(
          primary: ColorsManger.primaryDark,
          secondary: ColorsManger.secondaryDark),
      textTheme: TextTheme(
          labelMedium: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManger.primaryDark),
          titleMedium: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManger.primaryDark),
          titleSmall: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManger.primaryDark),
          bodyMedium: TextStyle(
              color: ColorsManger.secondaryDark,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp)));
}
