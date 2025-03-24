import 'package:flutter/material.dart';
import 'package:widgets_test/theme/color.dart';

class CustomTextFormField extends StatelessWidget {
  final double? maxWidth;
  final IconData? prefixIcon;
  final String hintText;
  final String? labelText;
  final ValueChanged<String>? onChange;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  const CustomTextFormField(
      {super.key,
      this.maxWidth,
      this.prefixIcon,
      required this.hintText,
      this.labelText,
      this.onChange,
      // this.error,
      this.validator,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChange,
      onSaved: onSaved,
      decoration: InputDecoration(
          // errorText: error,
          constraints: BoxConstraints(maxWidth: maxWidth ?? 120.0),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: 22.0,
                  color: const Color(0xFFc2c2c2),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14.0),
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColor.blackPlaceholder),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColor.blackPlaceholder, width: 0.2),
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
  }
}
