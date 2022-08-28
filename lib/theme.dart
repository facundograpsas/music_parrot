import 'package:flutter/material.dart';

import 'constants/colors_constants.dart';

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.babyGreen,
      onPrimary: Colors.black,
      secondary: AppColors.cakeGreen,
      onSecondary: AppColors.spaceCadet,
      background: AppColors.cakeYellow,
    ),
  );
}
