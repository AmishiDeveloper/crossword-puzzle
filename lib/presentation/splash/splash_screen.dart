import 'package:crossword_puzzle/core/const/images/app_images.dart';
import 'package:crossword_puzzle/presentation/grid_dimensions/grid_dimensions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key}); //const SplashScreen({Key? key}) : super(key:key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GridDimensionsScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [
                colorScheme.primaryContainer,colorScheme.onSecondaryContainer],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.crosswordPuzzle,
              width: 180.w,
              height: 180.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 25.r),
            Text('Crossword Puzzle', style: themeData.textTheme.headlineLarge),
          ],
          ),
        ),
      ),
    );
  }
}
