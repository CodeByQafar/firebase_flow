import 'package:firebase_flow/src/core/constants/margin.dart';
import 'package:firebase_flow/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

import '../constants/border_radius.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: AppColors.nightSky,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.nightSky,
      onPrimary: AppColors.fragrantWand,
      secondary: AppColors.blackBeauty,
      onSecondary: AppColors.fragrantWand,
      onTertiary: AppColors.bluishGreen,
    ),
    cardTheme: CardThemeData(
      color: AppColors.blackBeauty,

      margin: Margins.messageCardMargin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiuses.messageCardBorderRadius,
        side: BorderSide(
      color: AppColors.bluishGreen, // Border rəngi
      width: 1.0,         // Border qalınlığı
    ),
      ),
    ),
    hintColor: AppColors.fragrantWand,

    iconTheme: IconThemeData(color: AppColors.fragrantWand),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.blackBeauty,
        foregroundColor: AppColors.blackBeauty,
        side: BorderSide(
          color: AppColors.fragrantWand,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.fragrantWand),
      fillColor: AppColors.blackBeauty,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadiuses.textFieldBorderRadius,
        borderSide: BorderSide(color: AppColors.bluishGreen, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadiuses.textFieldBorderRadius,
        borderSide: BorderSide(color: AppColors.fragrantWand, width: 1.0),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.fragrantWand),
      bodyMedium: TextStyle(color: AppColors.fragrantWand),
      bodySmall: TextStyle(color: AppColors.fragrantWand),
    ),
  );
}
