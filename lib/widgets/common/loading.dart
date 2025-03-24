import 'package:flutter/material.dart';
import 'package:widgets_test/theme/color.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: CircularProgressIndicator(
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation<Color>(
                  AppColor.redColor.withValues(alpha: 0.6)),
            ),
          ),
          const SizedBox(
            width: 90,
            height: 90,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.redColor),
            ),
          ),
          Image.asset(
            "assets/images/networklink_logo.png",
            width: 60.0,
          )
        ],
      ),
    );
  }
}
