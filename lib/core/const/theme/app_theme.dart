import 'package:crossword_puzzle/core/const/colors/app_colors.dart';
import 'package:crossword_puzzle/core/const/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  const AppTheme._();

  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.deepPurple,
    brightness: Brightness.light,
  );
  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.lightGreen,
    brightness: Brightness.dark,
  );

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightColorScheme.surface,

      appBarTheme: AppBarThemeData(
        backgroundColor: lightColorScheme.surfaceContainer,
        foregroundColor: lightColorScheme.onSurface,
        centerTitle: true,
        elevation: 2.r,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: lightColorScheme.onSurface,
        ),
      ),

      textTheme: AppTextTheme.lightTextTheme(lightColorScheme),

      inputDecorationTheme: InputDecorationThemeData(
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: lightColorScheme.onSurfaceVariant,
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: lightColorScheme.onSurfaceVariant.withAlpha(150),
        ),
        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.error,
        ),
        errorMaxLines: 3,

        filled: true,
        fillColor: lightColorScheme.surfaceContainerLow,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
        // Borders
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: lightColorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: lightColorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: lightColorScheme.primary, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: lightColorScheme.error),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightColorScheme.primary,
          // Green accent button background
          foregroundColor: lightColorScheme.onPrimary,
          // Black/Dark readable text on green
          elevation: 2.r,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            height: 1.15,
          ),
        ),
      ),

      cardTheme: CardThemeData(
        color: lightColorScheme.surfaceContainerHigh,
        // Slightly elevated container dark background
        elevation: 1.0,
        shadowColor: Colors.black.withAlpha(100),
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: lightColorScheme.outlineVariant.withAlpha(80),
            // Subtle boundary
            width: 1.w,
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: darkColorScheme,
      scaffoldBackgroundColor: darkColorScheme.surface,

      appBarTheme: AppBarTheme(
        backgroundColor: darkColorScheme.surfaceContainer,
        // Clean dark header background
        foregroundColor: darkColorScheme.onSurface,
        // Title text and icon color
        elevation: 0.r,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: darkColorScheme.onSurface,
        ),
        iconTheme: IconThemeData(color: darkColorScheme.onSurface, size: 24.sp),
      ),

      textTheme: AppTextTheme.darkTextTheme(darkColorScheme),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkColorScheme.surfaceContainerLow,
        // Soft field background
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),

        // Hint & Label Styling
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: darkColorScheme.onSurfaceVariant.withAlpha(150),
        ),
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: darkColorScheme.onSurfaceVariant,
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: darkColorScheme.primary,
        ),
        errorStyle: TextStyle(
          fontSize: 12.sp,
          height: 1.2,
          color: darkColorScheme.error,
          // line height compact rakhne ke liye
        ),
        errorMaxLines: 3,

        // Borders
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: darkColorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: darkColorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: darkColorScheme.primary, width: 2.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: darkColorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: darkColorScheme.error, width: 2.w),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColorScheme.primary,
          // Green accent button background
          foregroundColor: darkColorScheme.onPrimary,
          // Black/Dark readable text on green
          elevation: 2.r,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),

      cardTheme: CardThemeData(
        color: darkColorScheme.surfaceContainerHigh,
        // Slightly elevated container dark background
        elevation: 1.0,
        shadowColor: Colors.black.withAlpha(100),
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: darkColorScheme.outlineVariant.withAlpha(80),
            // Subtle boundary
            width: 1.w,
          ),
        ),
      ),
    );
  }
}
