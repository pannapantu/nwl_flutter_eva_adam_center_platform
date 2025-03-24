import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:widgets_test/constants/format_message_manage_header.dart';
import 'package:widgets_test/models/format_message_manage_table_model.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/theme/text_styles.dart';
import 'package:widgets_test/viewmodels/format_message_manage/providers/format_message_manage_viewmodel.dart';
import 'package:widgets_test/viewmodels/format_message_manage/states/format_message_manage_state.dart';
import 'package:widgets_test/viewmodels/message_manage/providers/message_manage_viewmodel.dart';
import 'package:widgets_test/widgets/common/primary_button.dart';
import 'package:widgets_test/widgets/common/secondary_button.dart';
import 'package:widgets_test/widgets/modal.dart';

class FormatMessageManageTableDesktop extends ConsumerWidget {
  const FormatMessageManageTableDesktop({
    super.key,
    required this.formatMessageRefRead,
    required this.formatMessageRefWatch,
  });

  final FormatMessageManageViewModel formatMessageRefRead;
  final FormatMessageManageState formatMessageRefWatch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Table(
        columnWidths: const {
          0: FixedColumnWidth(60.0),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1.5),
          3: FlexColumnWidth(1.0),
          4: FlexColumnWidth(1.0),
        },
        border: const TableBorder.symmetric(
            inside: BorderSide(color: Color(0xFFe5e5e5), width: 0.8),
            outside: BorderSide(color: Color(0xFFe5e5e5), width: 0.8)),
        children: [
          TableRow(
              decoration: const BoxDecoration(color: AppColor.tableHeader),
              children:
                  formatMessageManageHeader.asMap().entries.map((entries) {
                final index = entries.key;
                return TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: index == 1 || index == 2 || index == 3
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entries.value,
                                  style: TextStyles.whiteBody,
                                  textAlign: TextAlign.center,
                                ),
                                IconButton(
                                  onPressed: () {
                                    ref
                                        .read(
                                            formatMessageManageViewModelProvider
                                                .notifier)
                                        .sortColumn(index);
                                  },
                                  icon: Icon(
                                      formatMessageRefWatch.sortedColumnIndex ==
                                                  index &&
                                              formatMessageRefWatch.isAscending
                                          ? FontAwesomeIcons.arrowUpAZ
                                          : FontAwesomeIcons.arrowDownAZ),
                                  color: Colors.white,
                                  iconSize: 16.0,
                                ),
                              ],
                            )
                          : Text(
                              entries.value,
                              style: TextStyles.whiteBody,
                              textAlign: TextAlign.start,
                            ),
                    ));
              }).toList()),
          ...formatMessageRefRead
              .getPaginatedMessageManage()
              .asMap()
              .entries
              .map((entries) {
            final int index = entries.key +
                (formatMessageRefWatch.currentPage *
                    formatMessageRefWatch.itemPerPage);
            return TableRow(
                decoration: BoxDecoration(
                  color:
                      index % 2 == 0 ? AppColor.evenColumn : AppColor.oddColumn,
                ),
                children: [
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      (index + 1).toString(),
                      textAlign: TextAlign.center,
                    ),
                  )),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(entries.value.msfName),
                  )),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                        Text(FormatMessageType.getTitle(entries.value.msfType)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(DateFormat("yyyy-MM-dd HH:mm")
                        .format(entries.value.createdDate)),
                  )),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      spacing: 10.0,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.penToSquare,
                            size: 20.0,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            CustomModal.show(context,
                                id: entries.value.msfId,
                                content: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.circleInfo,
                                      color: Colors.amber,
                                      size: 80.0,
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      "คุณต้องการลบข้อมูล ใช่หรือไม่",
                                      style: TextStyles.heading3,
                                    )
                                  ],
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SecondaryButton(
                                          text: "ยกเลิก",
                                          onPressed: Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop),
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                      PrimaryButton(
                                          text: "ลบข้อมูล",
                                          backgroundColor: AppColor.redColor,
                                          onPressed: () async {
                                            final currentContext = context;
                                            try {
                                              if (context.mounted) {
                                                Navigator.of(currentContext,
                                                        rootNavigator: true)
                                                    .pop();
                                              }
                                              await ref
                                                  .read(
                                                      messageManageViewModelProvider
                                                          .notifier)
                                                  .deleteMessageById(
                                                      entries.value.msfId);
                                            } catch (e) {
                                              print("Error $e");
                                            }
                                          }),
                                    ],
                                  )
                                ]);
                          },
                          icon: const Icon(
                            Icons.delete_outlined,
                            size: 22.0,
                          ),
                        ),
                      ],
                    ),
                  )),
                ]);
          })
        ]);
  }
}
