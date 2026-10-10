import 'package:crossword_puzzle/core/const/theme/app_theme.dart';
import 'package:crossword_puzzle/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      splitScreenMode: true,
      minTextAdapt: false,
        builder: (BuildContext context1, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Crossword Puzzle',
            themeMode: ThemeMode.system,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            home: const SplashScreen(),
          );
        }
    );
  }
}
