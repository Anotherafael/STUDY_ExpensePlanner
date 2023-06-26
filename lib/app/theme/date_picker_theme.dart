import 'package:flutter/material.dart';
import 'package:study_expense_planner/app/theme/app_colors.dart';

class DatePickerTheme extends Theme {
  DatePickerTheme(Widget child, {Key? key})
      : super(
          key: key,
          child: child,
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.tertiaryColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor, // button text color
              ),
            ),
          ),
        );
}
