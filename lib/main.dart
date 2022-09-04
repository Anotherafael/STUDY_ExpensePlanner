import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_expense_planner/modules/home/home_controller.dart';
import 'package:study_expense_planner/modules/home/home_page.dart';
import 'package:study_expense_planner/theme/app_theme.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: appTheme.defaultTheme,
      ),
    );
  }
}
