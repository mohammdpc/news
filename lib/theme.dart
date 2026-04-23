import 'package:flutter/material.dart';
import 'package:news/app utils/app_colors.dart';
import 'package:news/app%20utils/app_styles.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.lightBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.lightBackground,
    iconTheme: IconThemeData(
      color: AppColors.lightMainText
    ),
    titleTextStyle: AppStyles.medium20White.copyWith(color: AppColors.lightMainText),
  )
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      iconTheme: IconThemeData(
          color: AppColors.darkMainText
      ),
      titleTextStyle: AppStyles.medium20White,
    ),

);
