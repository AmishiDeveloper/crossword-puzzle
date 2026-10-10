import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String? text;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? textColor;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.child,
    this.text,
    this.suffixIcon,
    this.prefixIcon,
    this.textColor,
    this.height,
    this.width,
    this.padding,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  }) : assert(
  child != null || text != null,
  'Either text or child must be provided',
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    // Fallback standard style agar theme me explicitly set na ho
    final ButtonStyle baseStyle =
        themeData.elevatedButtonTheme.style ?? const ButtonStyle();


    final ButtonStyle effectiveStyle = baseStyle.copyWith(
      elevation: elevation != null ? WidgetStatePropertyAll(elevation) : null,
      backgroundColor: backgroundColor != null
          ? WidgetStatePropertyAll(backgroundColor)
          : null,
      foregroundColor: foregroundColor != null
          ? WidgetStatePropertyAll(foregroundColor)
          : (textColor != null ? WidgetStatePropertyAll(textColor) : null),
      padding: padding != null ? WidgetStatePropertyAll(padding) : null,
      shape: borderRadius != null
          ? WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      )
          : null,
    );

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48.h,
      child: ElevatedButton(
        style: effectiveStyle,
        onPressed: onPressed,
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  SizedBox(width: 8.w),
                ],
                if (text != null)
                  Flexible(
                    child: Text(
                      text!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (suffixIcon != null) ...[
                  SizedBox(width: 8.w),
                  suffixIcon!,
                ],
              ],
            ),
      ),
    );
  }
}