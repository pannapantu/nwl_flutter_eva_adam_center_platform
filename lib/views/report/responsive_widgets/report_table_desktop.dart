import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/constants/report_table_header.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/theme/text_styles.dart';
import 'package:widgets_test/viewmodels/report_data/report_data_viewmodel.dart';
import 'package:widgets_test/views/report/widgets/report_table.dart';

class ReportTableDesktop extends ConsumerWidget {
  const ReportTableDesktop({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportDataRefWatch = ref.watch(reportDataViewModelProvider);
    final reportDataRefRead = ref.read(reportDataViewModelProvider.notifier);
    return Table(
      defaultColumnWidth: const FlexColumnWidth(1.0),
      border: const TableBorder.symmetric(
          inside: BorderSide(color: Color(0xFFe5e5e5), width: 0.8),
          outside: BorderSide(color: Color(0xFFe5e5e5), width: 0.8)),
      children: [
        TableRow(
            decoration: const BoxDecoration(color: AppColor.tableHeader),
            children: reportTableHeader.map((item) {
              return TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  item,
                  style: TextStyles.whiteBody,
                  textAlign: TextAlign.start,
                ),
              ));
            }).toList()),
        ...reportDataRefRead.getPaginatedReports().asMap().entries.map((entry) {
          int index = entry.key +
              (reportDataRefWatch.currentPage * reportDataRefWatch.itemPerPage);
          var item = entry.value;

          return reportTable(index, item);
        })
      ],
    );
  }
}
