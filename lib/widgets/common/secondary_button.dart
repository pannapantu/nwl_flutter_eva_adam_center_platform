import 'package:flutter/material.dart';
import 'package:widgets_test/theme/color.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? backgroundColor;
  final double? width;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.width,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          animationDuration: const Duration(milliseconds: 200),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
              side: const BorderSide(
                  color: AppColor.blackPlaceholder, width: 0.5)),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          backgroundColor: backgroundColor ?? Colors.transparent,
          fixedSize: Size(width ?? 120, 48.0)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.0,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 22.0,
            ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: AppColor.blackPrimary),
          )
        ],
      ),
    );
  }
}
