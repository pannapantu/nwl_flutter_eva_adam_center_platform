import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:widgets_test/constants/app_constants.dart';
import 'package:widgets_test/theme/text_styles.dart';
import 'package:widgets_test/viewmodels/report_data/report_data_viewmodel.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/views/report/responsive_widgets/report_table_desktop.dart';
import 'package:widgets_test/views/report/responsive_widgets/report_table_mobile.dart';
import 'package:widgets_test/widgets/common/double_button.dart';
import 'package:widgets_test/widgets/common/primary_button.dart';
import 'package:widgets_test/widgets/common/pagination.dart';
import 'package:widgets_test/widgets/common/custom_dropdown_menu.dart';
import 'package:widgets_test/widgets/common/date_picker.dart';

class ReportData extends ConsumerStatefulWidget {
  const ReportData({super.key});

  @override
  ConsumerState<ReportData> createState() => _ReportDataState();
}

class _ReportDataState extends ConsumerState<ReportData> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final reportDataController = Provider.of<ReportDataController>(context);

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColor.whitePrimary),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(
              height: 10.0,
            ),
            _buildFilterSection(screenWidth, ref),
            const SizedBox(
              height: 40.0,
            ),
            _buildExportSection(),
            const SizedBox(
              height: 20.0,
            ),
            _buildReportTable(constraints),
            const SizedBox(
              height: 20.0,
            ),
            _buildPagination(ref)
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return //Header
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "รายงาน",
          style: TextStyles.heading3,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 22.0,
            ))
      ],
    );
  }

  Widget _buildFilterSection(screenWidth, WidgetRef ref) {
    final reportDataRefWatch = ref.watch(reportDataViewModelProvider);
    final reportDataRefRead = ref.read(reportDataViewModelProvider.notifier);
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: [
        // Dropdown Menus

        CustomDropdownMenu(
            minWidth: 100.0,
            maxWidth: 150.0,
            width: screenWidth / 6,
            hintText: "Acting Type",
            menuEntry: actingTypeOptions),

        CustomDropdownMenu(
            minWidth: 100.0,
            maxWidth: 180.0,
            width: screenWidth / 6,
            hintText: "Installation Site",
            menuEntry: installationSiteOptions),

        // Date & Time Picker
        DatePicker(
          width: screenWidth / 4,
          hintText: "Start Date:",
          resultDate: reportDataRefWatch.startDate,
          setTime: reportDataRefRead.setStartDate,
        ),

        DatePicker(
          width: screenWidth / 4,
          hintText: "End Date:",
          resultDate: reportDataRefWatch.endDate,
          setTime: reportDataRefRead.setEndDate,
        ),

        PrimaryButton(
          text: "ค้นหา",
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildExportSection() {
    return //Export Buttons
        Row(
      children: [
        DoubleButton(
            firstIcon: FontAwesomeIcons.fileExcel,
            firstTitle: "Export excel",
            firstOnPressed: () {},
            secondIcon: FontAwesomeIcons.filePdf,
            secondTitle: "Export PDF",
            secondOnPressed: () {})
      ],
    );
  }

  Widget _buildReportTable(BoxConstraints constraints) {
    return constraints.maxWidth < minDesktopScreenWidth
        ? const ReportTableMobile()
        : const ReportTableDesktop();
  }

  Widget _buildPagination(WidgetRef ref) {
    final reportDataRefWatch = ref.watch(reportDataViewModelProvider);
    final reportDataRefRead = ref.read(reportDataViewModelProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pagination(
            itemLength: reportDataRefWatch.listReport.length,
            itemPerPage: reportDataRefWatch.itemPerPage,
            currentPage: reportDataRefWatch.currentPage,
            changePage: reportDataRefRead.changePage),
      ],
    );
  }
}
