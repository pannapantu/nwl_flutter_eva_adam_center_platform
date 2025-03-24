import 'package:flutter/material.dart';

class DoubleButton extends StatelessWidget {
  final IconData? firstIcon;
  final String firstTitle;
  final VoidCallback firstOnPressed;
  final IconData? secondIcon;
  final String secondTitle;
  final VoidCallback secondOnPressed;
  const DoubleButton({
    super.key,
    this.firstIcon,
    required this.firstTitle,
    required this.firstOnPressed,
    this.secondIcon,
    required this.secondTitle,
    required this.secondOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.zero,
                      bottomRight: Radius.zero))),
          onPressed: firstOnPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (firstIcon != null) ...[
                Icon(
                  firstIcon,
                  size: 18.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
              ],
              Text(
                firstTitle,
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.zero,
                      bottomLeft: Radius.zero))),
          onPressed: secondOnPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (secondIcon != null) ...[
                Icon(
                  secondIcon,
                  size: 18.0,
                ),
                const SizedBox(
                  width: 8.0,
                ),
              ],
              Text(
                secondTitle,
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
      ],
    );
  }
}
