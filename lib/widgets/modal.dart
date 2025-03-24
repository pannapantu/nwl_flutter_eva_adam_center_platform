import 'package:flutter/material.dart';
import 'package:widgets_test/theme/color.dart';

class CustomModal extends StatelessWidget {
  final String? title;
  final Widget content;
  final List<Widget> actions;
  final String? id;

  const CustomModal({
    super.key,
    this.title,
    required this.actions,
    required this.content,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20.0),
      backgroundColor: AppColor.whitePrimary,
      content: content,
      actions: actions,
    );
  }

  static Future<void> show(
    BuildContext context, {
    String? id,
    String? title,
    required Widget content,
    required List<Widget> actions,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing by clicking outside
      builder: (context) => CustomModal(
        title: title,
        content: content,
        actions: actions,
      ),
    );
  }
}
