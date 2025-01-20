import 'package:flutter/material.dart';

import 'constants/app_text.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? borderRadius;

  const AppButton({
    super.key,
    this.onTap,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(backgroundColor),
            elevation: WidgetStateProperty.all(0),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 30),
              ),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          child: AppText.small(
            text ?? 'Continue',
            color: textColor,
          ),
        ),
      ),
    );
  }
}
