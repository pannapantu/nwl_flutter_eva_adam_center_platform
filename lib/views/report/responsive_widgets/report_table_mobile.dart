import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/constants/report_table_header.dart';
import 'package:widgets_test/theme/text_styles.dart';
import 'package:widgets_test/viewmodels/report_data/report_data_viewmodel.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/views/report/widgets/report_table.dart';

class ReportTableMobile extends ConsumerWidget {
  const ReportTableMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportDataRefWatch = ref.watch(reportDataViewModelProvider);
    final reportDataRefRead = ref.read(reportDataViewModelProvider.notifier);
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      }),
      child: Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        interactive: true,
        thickness: 8.0,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Table(
            columnWidths: const {
              0: FixedColumnWidth(60),
              1: FixedColumnWidth(80),
              2: FixedColumnWidth(120),
              3: FixedColumnWidth(100),
              4: FixedColumnWidth(100),
              5: FixedColumnWidth(140),
              6: FixedColumnWidth(160),
              7: FixedColumnWidth(160),
              8: FixedColumnWidth(140),
              9: FixedColumnWidth(140),
            },
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
                        textAlign: TextAlign.center,
                      ),
                    ));
                  }).toList()),
              ...reportDataRefRead
                  .getPaginatedReports()
                  .asMap()
                  .entries
                  .map((entry) {
                int index = entry.key +
                    (reportDataRefWatch.currentPage *
                        reportDataRefWatch.itemPerPage);
                var item = entry.value;

                return reportTable(index, item);
              })
            ],
          ),
        ),
      ),
    );
  }
}
