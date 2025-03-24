import 'package:widgets_test/models/report_table_model.dart';

class ReportDataState {
  final String startDate;
  final String endDate;
  final int itemPerPage;
  final int currentPage;
  final List<ReportTable> listReport;

  ReportDataState({
    required this.startDate,
    required this.endDate,
    required this.itemPerPage,
    required this.currentPage,
    required this.listReport,
  });

  ReportDataState copyWith({
    String? startDate,
    String? endDate,
    int? itemPerPage,
    int? currentPage,
    List<ReportTable>? listReport,
  }) {
    return ReportDataState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      itemPerPage: itemPerPage ?? this.itemPerPage,
      currentPage: currentPage ?? this.currentPage,
      listReport: listReport ?? this.listReport,
    );
  }
}
