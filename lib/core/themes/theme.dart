import 'package:flutter/material.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

final theme = ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
    centerTitle: true,
    toolbarHeight: 56,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  ),
  textTheme: _textTheme,
);

const _textTheme = TextTheme(
  headlineLarge: TextStyle(
    color: AppColors.black,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  ),
  headlineSmall: TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
  displayMedium: TextStyle(
    color: AppColors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  displaySmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  ),
  labelMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  labelSmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  bodySmall: TextStyle(
    color: AppColors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
);
