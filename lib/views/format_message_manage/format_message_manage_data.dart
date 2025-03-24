import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/theme/text_styles.dart';
import 'package:widgets_test/viewmodels/format_message_manage/providers/format_message_manage_viewmodel.dart';
import 'package:widgets_test/views/format_message_manage/responsive_widgets/format_message_manage_table_desktop.dart';
import 'package:widgets_test/widgets/common/custom_dropdown_menu.dart';
import 'package:widgets_test/widgets/common/custom_text_form_field.dart';
import 'package:widgets_test/widgets/common/loading.dart';
import 'package:widgets_test/widgets/common/pagination.dart';
import 'package:widgets_test/widgets/common/primary_button.dart';

class FormatMessageManageData extends ConsumerWidget {
  const FormatMessageManageData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatMessageManageState =
        ref.watch(formatMessageManageViewModelProvider);

    if (formatMessageManageState.isLoading) {
      return const Loading();
    }

    if (formatMessageManageState.error != null) {
      return Center(
          child: Text(formatMessageManageState.error.toString(),
              textAlign: TextAlign.center, style: TextStyles.errorLabel1));
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: AppColor.whitePrimary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeader(),
          const SizedBox(
            height: 20.0,
          ),
          _buildButtonSection(context, ref),
          const SizedBox(
            height: 20.0,
          ),
          _buildDataTable(ref),
          const SizedBox(
            height: 10.0,
          ),
          _buildPagination(ref),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "จัดการป้ายประชาสัมพันธ์ > ชุดข้อความ",
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

  Widget _buildButtonSection(BuildContext context, WidgetRef ref) {
    List<String> options = ["option 1", "option 1"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10.0,
          children: [
            const Form(
                child: CustomTextFormField(
              maxWidth: 200.0,
              hintText: "Search",
              prefixIcon: Icons.search,
            )),
            CustomDropdownMenu(
                maxWidth: 200.0,
                width: 150.0,
                hintText: "ชื่อข้อความ",
                menuEntry: options),
            CustomDropdownMenu(
                maxWidth: 200.0,
                width: 170.0,
                hintText: "ประเภทข้อความ",
                menuEntry: options),
            CustomDropdownMenu(
                maxWidth: 200.0,
                width: 108.0,
                hintText: "สถานะ",
                menuEntry: options),
            PrimaryButton(text: "ค้นหา", onPressed: () {}),
          ],
        ),
        PrimaryButton(
          text: "เพิ่มชุดข้อความ",
          onPressed: () {},
          backgroundColor: const Color(0xFF6366f1),
          icon: Icons.add,
          width: 142.0,
        )
      ],
    );
  }

  Widget _buildDataTable(WidgetRef ref) {
    final formatMessageRefRead =
        ref.read(formatMessageManageViewModelProvider.notifier);
    final formatMessageRefWatch =
        ref.watch(formatMessageManageViewModelProvider);

    return FormatMessageManageTableDesktop(
        formatMessageRefRead: formatMessageRefRead,
        formatMessageRefWatch: formatMessageRefWatch);
  }

  Widget _buildPagination(WidgetRef ref) {
    final formMessageManageState =
        ref.watch(formatMessageManageViewModelProvider);
    final formMessageManageRead =
        ref.read(formatMessageManageViewModelProvider.notifier);
    return Pagination(
      itemPerPage: formMessageManageState.itemPerPage,
      currentPage: formMessageManageState.currentPage,
      itemLength: formMessageManageState.listOfFormatMessages.length,
      changePage: formMessageManageRead.changePage,
    );
  }
}
