import 'package:flutter/material.dart';
import 'package:study_expense_planner/theme/app_colors.dart';

/// This class contains all the text styles used in the app.
class AppTypographies {
  static TextStyle get cardTitleTextStyle => TextStyle(
        fontFamily: 'OpenSans',
        color: AppColors.black,
        fontSize: 17,
      );

  static TextStyle get cardDateTextStyle => TextStyle(
        fontFamily: 'OpenSans',
        color: AppColors.grey,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get noTransactionsTextStyle => TextStyle(
        fontFamily: 'OpenSans',
        color: AppColors.black,
        fontSize: 24,
      );
}
