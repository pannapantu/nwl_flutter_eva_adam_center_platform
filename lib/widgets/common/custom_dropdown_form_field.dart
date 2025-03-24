import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final double width;
  final String hintText;
  final List<dynamic> menuEntry;
  final String? selectedValue;
  final ValueChanged<dynamic>? onChanged;
  final String? Function(String?)? validator; // ✅ Added validator support
  final double? maxWidth;
  final double? minWidth;

  const CustomDropdownButtonFormField({
    super.key,
    required this.width,
    required this.hintText,
    required this.menuEntry,
    this.selectedValue,
    this.onChanged,
    this.validator,
    this.maxWidth,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth ?? width,
        maxWidth: maxWidth ?? width,
      ),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: selectedValue == null ? hintText : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        ),
        items: menuEntry.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, overflow: TextOverflow.ellipsis),
          );
        }).toList(),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
