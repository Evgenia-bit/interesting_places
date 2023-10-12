import 'package:flutter/material.dart';
import 'package:interesting_places/core/themes/app_colors.dart';

final lightTheme = ThemeData(
  appBarTheme: _appBarTheme,
  inputDecorationTheme: _inputDecorationTheme,
  textTheme: _textTheme,
  colorScheme: _lightColorScheme,
);

final darkTheme = ThemeData(
  appBarTheme: _appBarTheme,
  inputDecorationTheme: _inputDecorationTheme,
  textTheme: _textTheme,
  colorScheme: _darkColorScheme,
);

const _appBarTheme = AppBarTheme(
  elevation: 0,
  color: Colors.transparent,
  centerTitle: true,
  toolbarHeight: 56,
);

const _inputDecorationTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
);

const _lightColorScheme = ColorScheme.light(
  background: AppColors.white,
  primary: AppColorsLight.green,
  secondary: AppColors.lightGrey,
  tertiary: AppColorsLight.black,
  surface: AppColors.white,
  error: Color.fromRGBO(239, 67, 67, 0.4),
);

const _darkColorScheme = ColorScheme.dark(
  background: AppColorsDark.black,
  primary: AppColorsDark.green,
  secondary: AppColorsDark.darkBlack,
  tertiary: AppColors.white,
  surface: Color.fromRGBO(59, 62, 91, 1),
  error: Color.fromRGBO(207, 42, 42, 0.4),
);

const _textTheme = TextTheme(
  headlineMedium: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  headlineSmall: TextStyle(
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
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
);
