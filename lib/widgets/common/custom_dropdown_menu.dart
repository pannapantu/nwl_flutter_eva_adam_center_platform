import 'package:flutter/material.dart';
import 'package:widgets_test/theme/text_styles.dart';

class CustomDropdownMenu extends StatelessWidget {
  final double width;
  final String hintText;
  final List<dynamic> menuEntry;
  final String? selectedValue;
  final ValueChanged<dynamic>? onChanged;
  final double? maxWidth;
  final double? minWidth;
  const CustomDropdownMenu({
    super.key,
    required this.width,
    required this.hintText,
    required this.menuEntry,
    this.selectedValue,
    this.onChanged,
    this.maxWidth,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: minWidth ?? width, maxWidth: maxWidth ?? width),
      child: DropdownMenu(
        textStyle: TextStyles.caption,
        requestFocusOnTap: false,
        width: width,
        hintText: hintText,
        onSelected: onChanged,
        dropdownMenuEntries: menuEntry.map((item) {
          return DropdownMenuEntry(value: item, label: item);
        }).toList(),
      ),
    );
  }
}
