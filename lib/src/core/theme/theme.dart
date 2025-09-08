import 'package:firebase_flow/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

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
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
