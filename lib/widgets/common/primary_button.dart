import 'package:flutter/material.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/theme/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? backgroundColor;
  final double? width;
  final Function(String)? onSelected;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.width,
    required this.onPressed,
    this.icon, this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          animationDuration: const Duration(milliseconds: 200),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(14.0)),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          backgroundColor: backgroundColor ?? AppColor.greenButton,
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
            style: TextStyles.whiteCaption,
          )
        ],
      ),
    );
  }
}
