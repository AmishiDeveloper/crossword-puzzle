import 'package:crossword_puzzle/shared_custom_widgets/dialog/custom_crossword_puzzle_dialog.dart';
import 'package:crossword_puzzle/shared_custom_widgets/elevated_button/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Helper {

  static Future<void> showExitDialog(BuildContext context) async {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    await showCustomCrosswordPuzzleDialog(
      context,
      child: Builder(
        builder: (exitDialogContext) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Dialog Icon
              Container(
                padding: EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.error.withOpacity(0.12),
                ),
                child: Icon(
                  Icons.exit_to_app_rounded,
                  size: 40.sp,
                  color: colorScheme.error,
                ),
              ),
              SizedBox(height: 16.h),

              // Title
              Text(
                'Leave App?',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),

              // Subtitle
              Text(
                'Are you sure you want to leave Crossword Puzzle?',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),

              // Action Buttons (No / Yes)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(exitDialogContext);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CustomElevatedButton(
                    width: 95.w,
                    height: 48.h,
                    text: 'Yes',
                    backgroundColor: colorScheme.error,
                    foregroundColor: colorScheme.onError,
                    onPressed: () {
                      Navigator.pop(exitDialogContext);
                      SystemNavigator.pop(); // App close kar dega
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }


}