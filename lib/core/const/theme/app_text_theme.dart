import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme{

  const AppTextTheme._();

  static TextTheme lightTextTheme(ColorScheme lightColorScheme) {
    return TextTheme(
      // Headlines / Page Titles
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: lightColorScheme.onSurface,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: lightColorScheme.onSurface,
      ),
      // Section Headers
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: lightColorScheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: lightColorScheme.onSurface,
      ),
      // Body Text / Descriptions
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: lightColorScheme.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color:
        lightColorScheme.onSurfaceVariant, // Muted text for secondary body
      ),
      // Captions / Subtitles
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: lightColorScheme.onSurfaceVariant,
      ),
    );
  }

  static TextTheme darkTextTheme(ColorScheme darkColorScheme) {
    return TextTheme(
      // Headlines / Page Titles
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: darkColorScheme.onSurface,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: darkColorScheme.onSurface,
      ),
      // Section Headers
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: darkColorScheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: darkColorScheme.onSurface,
      ),
      // Body Text / Descriptions
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: darkColorScheme.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color:
        darkColorScheme.onSurfaceVariant, // Muted text for secondary body
      ),
      // Captions / Subtitles
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: darkColorScheme.onSurfaceVariant,
      ),
    );
  }
}
