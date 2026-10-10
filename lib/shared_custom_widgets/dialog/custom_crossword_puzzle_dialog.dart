import 'dart:ui';
import 'package:crossword_puzzle/core/const/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<T?> showCustomCrosswordPuzzleDialog<T>(
    BuildContext context, {
      required Widget child,
      bool cancellable = true,
    }) async {

  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: cancellable,
    barrierLabel: 'Dismiss Dialog',
    barrierColor: AppColors.black.withOpacity(0.65),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) {
      return _CustomCrosswordPuzzleDialog(
        cancellable: cancellable,
        child: child,
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, childWidget) {
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: childWidget,
      );
    },
  );
}

class _CustomCrosswordPuzzleDialog extends StatelessWidget {
  final Widget child;
  final bool cancellable;

  const _CustomCrosswordPuzzleDialog({
    required this.child,
    this.cancellable = true,
    //this.blurAmount = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return PopScope(
      canPop: cancellable,
        child:Dialog(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh.withOpacity(0.85),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: colorScheme.outlineVariant.withOpacity(0.4),
                width: 1.2.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.3),
                  blurRadius: 16.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.r),
            child: SingleChildScrollView(child: child),
          ),
        ),
    );
  }
}
