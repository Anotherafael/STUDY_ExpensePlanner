import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/home/home_controller.dart';
import '../modules/home/home_page.dart';
import '../theme/app_theme.dart';

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
        home: const HomePage(),
        theme: appTheme.defaultTheme,
      ),
    );
  }
}
