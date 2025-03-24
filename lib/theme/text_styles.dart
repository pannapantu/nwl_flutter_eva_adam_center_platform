import 'package:flutter/material.dart';
import 'package:widgets_test/theme/color.dart';

class TextStyles {
  // Normal State (light mode)
  static const TextStyle headingBold1 = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColor.black,
      overflow: TextOverflow.ellipsis);

  static const TextStyle heading1 = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: AppColor.black,
      overflow: TextOverflow.ellipsis);

  static const TextStyle heading2 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColor.black,
      overflow: TextOverflow.ellipsis);

  static const TextStyle headingBold2 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColor.black,
      overflow: TextOverflow.ellipsis);

  static const TextStyle headingBold3 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColor.black,
      overflow: TextOverflow.ellipsis);

  static const TextStyle heading3 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColor.black,
      overflow: TextOverflow.ellipsis);

  static const TextStyle heading4 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColor.black,
      overflow: TextOverflow.ellipsis);

  static const TextStyle headingBold4 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColor.black,
      overflow: TextOverflow.ellipsis);

  static const TextStyle body = TextStyle(
      fontSize: 16,
      color: AppColor.blackPrimary,
      overflow: TextOverflow.ellipsis);

  static const TextStyle bodyBold = TextStyle(
      fontSize: 16,
      color: AppColor.blackPrimary,
      overflow: TextOverflow.ellipsis);

  static const TextStyle whiteBody = TextStyle(
    fontSize: 16,
    color: AppColor.whitePrimary,
    overflow: TextOverflow.ellipsis,
  );

  static const TextStyle caption = TextStyle(
      fontSize: 14,
      color: AppColor.blackPrimary,
      overflow: TextOverflow.ellipsis);

  static const TextStyle whiteCaption = TextStyle(
      fontSize: 14,
      color: AppColor.whitePrimary,
      overflow: TextOverflow.ellipsis);

  // Error state
  static const TextStyle errorLabel1 =
      TextStyle(fontSize: 16, color: AppColor.redColor);

  static const TextStyle errorLabel2 =
      TextStyle(fontSize: 14, color: AppColor.redColor);
}
