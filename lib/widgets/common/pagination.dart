import 'package:flutter/material.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:widgets_test/theme/color.dart';

class Pagination extends StatelessWidget {
  const Pagination({
    super.key,
    required this.itemLength,
    required this.itemPerPage,
    required this.currentPage,
    required this.changePage,
  });

  final int itemLength;
  final int itemPerPage;
  final int currentPage;
  final Function(int) changePage;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      // Make Container have  fit-content width
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: AppColor.blackAlpha45Primary),
            borderRadius: BorderRadius.circular(10.0)),
        child: NumberPagination(
          enableInteraction: false,
          selectedButtonColor: AppColor.redColor,
          selectedNumberColor: AppColor.whitePrimary,
          buttonElevation: 0.0,
          onPageChanged: (int index) {
            changePage(index - 1);
          },
          betweenNumberButtonSpacing: 0.0,
          totalPages: (itemLength / itemPerPage).ceil(),
          currentPage: currentPage + 1,
          visiblePagesCount: 5,
        ),
      ),
    );
  }
}
