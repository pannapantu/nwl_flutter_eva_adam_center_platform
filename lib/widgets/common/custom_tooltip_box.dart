// Custom Tooltip Widget
import 'package:flutter/material.dart';
import 'package:widgets_test/theme/text_styles.dart';

class TooltipBox extends StatelessWidget {
  final String text;
  final Color color;

  const TooltipBox({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyles.whiteCaption,
        ),
      ),
    );
  }
}
